package actport

import actport.simulink._

/** Datatype for Links.
  *
  * @param start start block
  * @param startPort start port number
  * @param destination destination block
  * @param destinationPort destination port number
  * @param points points for routing
  */
case class Link(start: String,
                startPort: Int,
                destination: String,
                destinationPort: Int,
                points: Vector[Point] = Vector.empty) {

  /** Convert link to an expression.
    *
    * @param path location of link in diagram
    * @return sequence of expressions to create the link
    */
  def toExpression(path: SimulinkPath): Seq[Expression] = {
    val s = SimulinkPort(s"$start/$startPort")
    val d = SimulinkPort(s"$destination/$destinationPort")
    Seq(AddLine(path, s, d, SmartAutoRouting))
  }
}
