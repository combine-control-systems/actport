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
  def toExpression(diagram: Diagram, path: SimPath): Seq[Expression] = {
    // Port mapping for start port.
    // The default value is to use the same port identifier as Activate does.
    val startBlock = diagram.children.find(_.name == start)
    val mappedStartPort = startBlock.map {

      case block: ActivateBlock =>
        block.portMappings.getOrElse((startPort, linkType, OutputPort), startPort.toString)

      case block: ActivateSuperBlock =>
        block.portMappings.getOrElse((startPort, linkType, OutputPort), startPort.toString)

    }.getOrElse(startPort.toString)

    // Port mapping for end port.
    // The default value is to use the same port identifier as Activate does.
    val destinationBlock = diagram.children.find(_.name == destination)
    val mappedDestinationPort = destinationBlock.map {

      case block: ActivateBlock  =>
        block.portMappings.getOrElse((destinationPort, linkType, InputPort), destinationPort.toString)

      case block: ActivateSuperBlock  =>
        block.portMappings.getOrElse((destinationPort, linkType, InputPort), destinationPort.toString)

    }.getOrElse(destinationPort.toString)

    // Apply port mapping.
    val s = SimPort(s"$start/$mappedStartPort")
    val d = SimPort(s"$destination/$mappedDestinationPort")
    Vector(AddLine(path, s, d, SmartAutoRouting))
  }
}
