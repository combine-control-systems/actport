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
                linkType: LinkType,
                points: Vector[Point] = Vector.empty) {

  /** Convert link to an expression.
    *
    * @param path location of link in diagram
    * @return sequence of expressions to create the link
    */
  def toExpression(diagram: Diagram, path: SimulinkPath): Seq[Expression] = {
    // Port mapping for start port.
    val startBlock = diagram.children.find(_.name == start)
    val mappedStartPort = startBlock.map {
      case block: ActivateBlock => generators.getGenerator(block)
        .outputPortMapping(block, startPort, linkType)
      case block: ActivateSuperBlock => generators.getGenerator(block)
        .outputPortMapping(block, startPort, linkType)
    }.getOrElse(startPort.toString)

    // Port mapping for end port.
    val destinationBlock = diagram.children.find(_.name == destination)
    val mappedDestinationPort = destinationBlock.map {
      case block: ActivateBlock => generators.getGenerator(block)
        .inputPortMapping(block, destinationPort, linkType)
      case block: ActivateSuperBlock => generators.getGenerator(block)
        .inputPortMapping(block, destinationPort, linkType)
    }.getOrElse(destinationPort.toString)

    val s = SimulinkPort(s"$start/$mappedStartPort")
    val d = SimulinkPort(s"$destination/$mappedDestinationPort")
    Seq(AddLine(path, s, d, SmartAutoRouting))
  }
}
