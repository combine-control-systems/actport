package actport.simulink

import java.awt.{Color, Rectangle}
import java.util.UUID

import monocle.macros.syntax.lens._

/** Matlab expression. */
sealed trait Expression {
  /** Serialize expression to a string executable in Matlab. */
  def serialize: String

  def withFullPath(path: SimPath): Expression
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

  override def withFullPath(path: SimPath): Expression = this
}

/** Opens a system.
  *
  * @param name name of system to open
  */
case class OpenSystem(name: String) extends Expression {
  override def serialize: String = s"open_system('$name');"

  override def withFullPath(path: SimPath): Expression = this
}

/** Adds a new Simulink block.
  *
  * @param source      Simulink source block
  * @param destination destination in model including name of block
  */
case class AddBlock(source: SimSource, destination: SimPath) extends Expression {
  override def serialize: String = s"add_block('$source', '$destination');"

  override def withFullPath(path: SimPath): Expression = this.lens(_.destination).set(path / destination.path)
}

case class AddAnnotation(text: SimPath, position: Rectangle) extends Expression {
  override def serialize: String = {
    val v = position
    s"add_block('built-in/Area', $text, 'Position', [${v.x},${-v.y - v.height},${v.x + v.width},${-v.y}]);"
  }

  override def withFullPath(path: SimPath): Expression =
    this.lens(_.text).set(SimPath(s"['$path/', ${text.path}]"))
}

/** Adds a clean subsystem without any ports and internal links.
  *
  * @param destination destination in model including name of subsystem
  */
case class AddCleanSubsystem(destination: SimPath) extends Expression {
  override def serialize: String = Seq(
    AddBlock(SimSource("simulink/Ports & Subsystems/Subsystem"), destination),
    DeleteLine(destination, SimPort("In1/1"), SimPort("Out1/1")),
    DeleteBlock(destination / "In1"),
    DeleteBlock(destination / "Out1")
  ).map(_.serialize).mkString("\n")

  override def withFullPath(path: SimPath): Expression = this.lens(_.destination).set(path / destination.path)
}

/** Deletes a line from the model.
  *
  * @param system     path to the containing system
  * @param outputPort start port of line
  * @param inputPort  end port of line
  */
case class DeleteLine(system: SimPath, outputPort: SimPort, inputPort: SimPort) extends Expression {
  override def serialize: String = s"delete_line('$system', '$outputPort', '$inputPort');"

  override def withFullPath(path: SimPath): Expression = this.lens(_.system).set(path / system.path)
}

/** Deletes a block from the model.
  *
  * @param block path to block to delete
  */
case class DeleteBlock(block: SimPath) extends Expression {
  override def serialize: String = s"delete_block('$block');"

  override def withFullPath(path: SimPath): Expression = this.lens(_.block).set(path / block.path)
}

/** Sets a parameters of a Simulink block.
  *
  * @param target                block to set parameter on
  * @param args                  array of name of parameter and values
  * @param putQuotesAroundString if false not quotes nor escaping of values will take place
  * @tparam A type of value
  */
case class SetParam[A](target: SimPath, args: Seq[(SimParName, A)],
                       putQuotesAroundString: Boolean = true) extends Expression {

  import ValueOps._

  override def serialize: String = {
    val parameterNames = args.map(_._1.toString)
    val serializedValues = args.map { arg =>
      arg._2 match {
        case v: String if putQuotesAroundString => s"'${v.escape}'"
        case v: String if !putQuotesAroundString => v // No escaping of quotes needed.
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
    }

    val pairs = parameterNames.zip(serializedValues).foldLeft(Vector.empty[String]) {
      case (v, (name, value)) => v ++ Vector(s"'$name'", value)
    }

    s"set_param('$target', ${pairs.mkString(", ")});"
  }

  override def withFullPath(path: SimPath): Expression = this.lens(_.target).set(path / target.path)
}

/** Adds a line to the model.
  *
  * @param system      path to containing system
  * @param out         start port of line
  * @param in          end port of line
  * @param autoRouting type of auto routing
  */
case class AddLine(system: SimPath, out: SimPort, in: SimPort,
                   autoRouting: AutoRouting = DisableAutoRouting) extends Expression {
  override def serialize: String =
    s"add_line('$system', '$out', '$in', 'autorouting', '${autoRouting.value}');"

  override def withFullPath(path: SimPath): Expression = this.lens(_.system).set(path / system.path)
}

/** Sets script of a Matlab function block.
  *
  * @param path   location of block
  * @param script Matlab script to assign to the block
  */
case class SetMatlabFunctionScript(path: SimPath, script: MatlabScript) extends Expression {
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

  override def withFullPath(p: SimPath): Expression = this.lens(_.path).set(p / path.path)
}

/** Use Simulink's automatic model arrangement functionality.
  *
  * @param path system to arrange
  */
case class ArrangeSystem(path: SimPath = SimPath("")) extends Expression {
  override def serialize: String = s"Simulink.BlockDiagram.arrangeSystem('$path');"

  override def withFullPath(p: SimPath): Expression = this.lens(_.path).set(p / path.path)
}
