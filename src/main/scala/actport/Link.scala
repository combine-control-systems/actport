package actport

import actport.simulink.SmartAutoRouting

case class Link(start: String,
                startPort: Int,
                destination: String,
                destinationPort: Int,
                points: Vector[Point] = Vector.empty) {

  def toMatlab(path: String): Seq[String] = {
    val s = s"$start/$startPort"
    val d = s"$destination/$destinationPort"
    Seq(
      simulink.addLine(path, s, d, SmartAutoRouting)
    )
  }
}
