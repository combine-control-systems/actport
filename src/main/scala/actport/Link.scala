package actport

case class Link(start: String,
                startPort: Int,
                destination: String,
                destinationPort: Int,
                points: Vector[Point] = Vector.empty)
