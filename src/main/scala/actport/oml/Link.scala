package actport.oml

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
                points: Vector[Point] = Vector.empty)
