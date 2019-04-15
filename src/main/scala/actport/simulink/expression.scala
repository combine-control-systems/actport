package actport.simulink

import java.awt.{Color, Rectangle}
import java.util.UUID

/** Matlab expression. */
sealed trait Expression {
  /** Serialize expression to a string executable in Matlab. */
  def serialize: String
}

/** Creates a new system using the `new_system` command in Matlab.
  *
  * @param name            name of system
  * @param errorIfShadowed generate an error if the name is shadowed
  */
case class NewSystem(name: String, errorIfShadowed: Boolean = false) extends Expression {
  override def serialize: String =
    if (errorIfShadowed) {
      s"new_system('$name', 'ErrorIfShadowed');"
    } else {
      s"new_system('$name');"
    }
}

/** Opens a system.
  *
  * @param name name of system to open
  */
case class OpenSystem(name: String) extends Expression {
  override def serialize: String = s"open_system('$name');"
}

/** Adds a new Simulink block.
  *
  * @param source      Simulink source block
  * @param destination destination in model including name of block
  */
case class AddBlock(source: SimulinkSource, destination: SimulinkPath) extends Expression {
  override def serialize: String = s"add_block('$source', '$destination');"
}

/** Adds a clean subsystem without any ports and internal links.
  *
  * @param destination destination in model including name of subsystem
  */
case class AddCleanSubsystem(destination: SimulinkPath) extends Expression {
  override def serialize: String = Seq(
    AddBlock(Simulink.PortsAndSubsystems.Subsystem, destination),
    DeleteLine(destination, SimulinkPort("In1/1"), SimulinkPort("Out1/1")),
    DeleteBlock(destination / "In1"),
    DeleteBlock(destination / "Out1")
  ).map(_.serialize).mkString("\n")
}

/** Raw expression for special cases.
  *
  * This expression should be used in exceptional cases only.
  *
  * @param expression raw expression
  */
case class RawExpression(expression: String) extends Expression {
  override def serialize: String = expression
}

/** Deletes a line from the model.
  *
  * @param system     path to the containing system
  * @param outputPort start port of line
  * @param inputPort  end port of line
  */
case class DeleteLine(system: SimulinkPath, outputPort: SimulinkPort, inputPort: SimulinkPort) extends Expression {
  override def serialize: String = s"delete_line('$system', '$outputPort', '$inputPort');"
}

/** Deletes a block from the model.
  *
  * @param block path to block to delete
  */
case class DeleteBlock(block: SimulinkPath) extends Expression {
  override def serialize: String = s"delete_block('$block');"
}

/** Sets a parameter of a Simulink block.
  *
  * @param target block to set parameter on
  * @param name   name of parameter
  * @param value  value to set
  * @tparam A type of value
  */
case class SetParam[A](target: SimulinkPath, name: SimulinkParameterName, value: A) extends Expression {

  import ValueOps._

  override def serialize: String = {
    val serializedValue = value match {
      case v: String => s"'${v.escape}'"
      case v: Boolean => s"'${v.toString.escape}'"
      case v: Int => s"'${v.toString.escape}'"
      case v: Double => s"'${v.toString.escape}'"
      // The Simulink coordinate system has a reverse sign on the vertical axis compared to Activate.
      case v: Rectangle => s"[${v.x},${-v.y - v.height},${v.x + v.width},${-v.y}]"
      case v: Color =>
        val components = v.getColorComponents(null)
        components.length match {
          case 3 => s"'[${components(0)},${components(1)},${components(2)}]'"
          case 4 => s"'[${components(0)},${components(1)},${components(2)},${components(3)}]'"
          // Default to white.
          case _ => s"'[1.0,1.0,1.0]'"
        }
    }
    s"set_param('$target', '$name', $serializedValue);"
  }
}

/** Adds a line to the model.
  *
  * @param system      path to containing system
  * @param out         start port of line
  * @param in          end port of line
  * @param autoRouting type of auto routing
  */
case class AddLine(system: SimulinkPath, out: SimulinkPort, in: SimulinkPort,
                   autoRouting: AutoRouting = DisableAutoRouting) extends Expression {
  override def serialize: String =
    s"add_line('$system', '$out', '$in', 'autorouting', '${autoRouting.value}');"
}

/** Sets script of a Matlab function block.
  *
  * @param path   location of block
  * @param script Matlab script to assign to the block
  */
case class SetMatlabFunctionScript(path: SimulinkPath, script: MatlabScript) extends Expression {
  override def serialize: String = {
    // Use a type 4 UUID as a suffix to avoid namespace collisions.
    val uuid = UUID.randomUUID().toString.replace("-", "")
    // A Matlab function block is really a Stateflow block in disguise.
    // https://stackoverflow.com/questions/10335564/load-code-for-a-matlab-function-block-at-simulink-runtime
    s"""sf_$uuid = sfroot();
       |block_$uuid = sf.find('Path', '$path', '-isa', 'Stateflow.EMChart');
       |block_$uuid.Script = '$script';
       |clear sf_$uuid;
       |clear block_$uuid;
     """.stripMargin
  }
}
