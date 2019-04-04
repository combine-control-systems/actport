package actport

import java.awt.Color

case class Diagram(name: Option[String] = None,
                   path: Option[String] = None,
                   children: Vector[Block] = Vector.empty,
                   backgroundColor: Color = Color.white,
                   diagram3d: Boolean = false,
                   zoom: Double = 1.0,
                   context: Vector[String] = Vector.empty,
                   explicitLinks: Vector[Link] = Vector.empty,
                   eventLinks: Vector[Link] = Vector.empty)
