package actport

import java.awt.Color

import actport.simulink.{Expression, SimulinkPath}

case class Diagram(name: Option[String] = None,
                   path: Option[String] = None,
                   children: Vector[Block] = Vector.empty,
                   backgroundColor: Color = Color.white,
                   diagram3d: Boolean = false,
                   zoom: Double = 1.0,
                   context: Vector[String] = Vector.empty,
                   explicitLinks: Vector[Link] = Vector.empty,
                   eventLinks: Vector[Link] = Vector.empty) {

  def toExpression(path: SimulinkPath): Seq[Expression] = {
    children.flatMap(_.toExpression(path)) ++
    explicitLinks.flatMap(_.toExpression(path))
  }
}
