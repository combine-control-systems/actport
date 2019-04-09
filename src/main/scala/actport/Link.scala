package actport

import actport.simulink.{AddLine, Expression, SmartAutoRouting}

case class Link(start: String,
                startPort: Int,
                destination: String,
                destinationPort: Int,
                points: Vector[Point] = Vector.empty) {

  def toExpression(path: String): Seq[Expression] = {
    val s = s"$start/$startPort"
    val d = s"$destination/$destinationPort"
    Seq(AddLine(path, s, d, SmartAutoRouting))
  }
}
