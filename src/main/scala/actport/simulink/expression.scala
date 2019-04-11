package actport.simulink

import java.awt.{Color, Rectangle}
import java.util.UUID

sealed trait Expression {
  def serialize: String
}

case class NewSystem(name: String, errorIfShadowed: Boolean = false) extends Expression {
  override def serialize: String =
    if (errorIfShadowed) {
      s"new_system('$name', 'ErrorIfShadowed');"
    } else {
      s"new_system('$name');"
    }
}

case class OpenSystem(name: String) extends Expression {
  override def serialize: String = s"open_system('$name');"
}

case class AddBlock(source: SimulinkSource, destination: SimulinkPath) extends Expression {
  override def serialize: String = s"add_block('$source', '$destination');"
}

case class DeleteLine(system: SimulinkPath, outputPort: SimulinkPort, inputPort: SimulinkPort) extends Expression {
  override def serialize: String = s"delete_line('$system', '$outputPort', '$inputPort');"
}

case class DeleteBlock(block: SimulinkPath) extends Expression {
  override def serialize: String = s"delete_block('$block');"
}

case class SetParam[A](target: SimulinkPath, name: SimulinkParameterName, value: A) extends Expression {
  override def serialize: String = {
    val serializedValue = value match {
      case v: String => s"'$v'"
      case v: Boolean => s"'${v.toString}'"
      case v: Int => s"'${v.toString}'"
      case v: Double => s"'${v.toString}'"
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

case class AddLine(system: SimulinkPath, out: SimulinkPort, in: SimulinkPort,
                   autoRouting: AutoRouting = DisableAutoRouting) extends Expression {
  override def serialize: String =
    s"add_line('$system', '$out', '$in', 'autorouting', '${autoRouting.value}');"
}

// https://stackoverflow.com/questions/10335564/load-code-for-a-matlab-function-block-at-simulink-runtime
case class SetMatlabFunctionScript(path: SimulinkPath, script: MatlabScript) extends Expression {
  override def serialize: String = {
    // Use a type 4 UUID as a suffix to avoid namespace collisions.
    val uuid = UUID.randomUUID()
    s"""sf_$uuid = sfroot();
       |block_$uuid = sf.find('Path', '$path', '-isa', 'Stateflow.EMChart');
       |block_$uuid.Script = '$script';
       |clear sf_$uuid;
       |clear block_$uuid;
     """.stripMargin
  }
}
