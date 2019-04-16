package actport

import java.awt.Color

import actport.simulink.{Expression, SimulinkPath}

/** Activate diagram.
  *
  * An Activate diagram can represent either the root diagram
  * or the contents of a subsystem.
  *
  * @param name            name of diagram
  * @param children        children of diagram
  * @param backgroundColor background color of diagram
  * @param diagram3d       unknown
  * @param zoom            zoom level
  * @param context         context of diagram defined using OML-code
  * @param explicitLinks   collection of explicit links in diagram
  * @param eventLinks      collection of event links in diagram
  */
case class Diagram(name: Option[String] = None,
                   children: Vector[Block] = Vector.empty,
                   backgroundColor: Color = Color.white,
                   diagram3d: Boolean = false,
                   zoom: Double = 1.0,
                   context: Vector[String] = Vector.empty,
                   explicitLinks: Vector[Link] = Vector.empty,
                   eventLinks: Vector[Link] = Vector.empty) {

  /** Convert diagram to a sequence of Matlab expressions.
    *
    * @param path location of diagram in model
    * @return expressions
    */
  def toExpression(path: SimulinkPath): Seq[Expression] = {
    children.flatMap(_.toExpression(this, path)) ++
      explicitLinks.flatMap(_.toExpression(this, path)) ++
      eventLinks.flatMap(_.toExpression(this, path))
  }
}
