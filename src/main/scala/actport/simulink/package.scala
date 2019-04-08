package actport

import java.awt.{Color, Rectangle}

package object simulink {
  def newSystem(name: String, errorIfShadowed: Boolean = false): String =
    if (errorIfShadowed) {
      s"new_system('$name', 'ErrorIfShadowed');"
    } else {
      s"new_system('$name');"
    }

  def openSystem(name: String): String = s"open_system('$name');"

  def addBlock(source: String, destination: String): String =
    s"add_block('$source', '$destination');"

  def deleteLine(system: String, outputPort: String, inputPort: String): String =
    s"delete_line('$system', '$outputPort', '$inputPort');"

  def deleteBlock(block: String): String =
    s"delete_block('$block');"

  def setParam(target: String, parameterName: String, parameterValue: String): String =
    s"set_param('$target', '$parameterName', '$parameterValue');"

  def setParam(target: String, parameterName: String, parameterValue: Boolean): String =
    setParam(target, parameterName, if (parameterValue) "1" else "0")

  def setParam(target: String, parameterName: String, parameterValue: Int): String =
    setParam(target, parameterName, parameterValue.toString)

  def setParam(target: String, parameterName: String, parameterValue: Double): String =
    setParam(target, parameterName, parameterValue.toString)

  def setParam(target: String, parameterName: String, parameterValue: Rectangle): String =
    s"set_param('$target', '$parameterName', [${parameterValue.x},${-parameterValue.y}," +
        s"${parameterValue.x + parameterValue.width},${-parameterValue.y + parameterValue.height}]);"

  def setParam(target: String, parameterName: String, parameterValue: Color): String = {
    val components = parameterValue.getColorComponents(null)
    components.length match {
      case 3 =>
        setParam(target, parameterName,
          s"[${components(0)},${components(1)},${components(2)}]")
      case 4 =>
        setParam(target, parameterName,
          s"[${components(0)},${components(1)},${components(2)},${components(3)}]")
    }
  }

  def addLine(system: String, out: String, in: String): String =
    s"add_line('$system', '$out', '$in');"

  def addLine(system: String, out: String, in: String, autoRouting: AutoRouting): String =
    s"add_line('$system', '$out', '$in', 'autorouting', '${autoRouting.value}');"
}
