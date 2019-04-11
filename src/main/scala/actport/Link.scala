package actport

import actport.simulink._

case class Link(start: String,
                startPort: Int,
                destination: String,
                destinationPort: Int,
                points: Vector[Point] = Vector.empty) {

  def toExpression(path: SimulinkPath): Seq[Expression] = {
    val s = SimulinkPort(s"$start/$startPort")
    val d = SimulinkPort(s"$destination/$destinationPort")
    Seq(AddLine(path, s, d, SmartAutoRouting))
  }
}
