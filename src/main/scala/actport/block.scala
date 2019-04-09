package actport

import java.awt.{Color, Rectangle}

import actport.simulink.Expression

sealed trait Block {
  def name: String
  def identity: String
  def origin: Point
  def size: Size
  def flip: Boolean
  def theta: Double
  def backgroundColor: Color
  def foregroundColor: Color
  def inputCount: Int
  def outputCount: Int
  def eventInputCount: Int
  def eventOutputCount: Int

  def rect: Rectangle = new Rectangle(origin.x, origin.y, size.width, size.height)

  def toExpression(path: String): Seq[Expression]
}

case class ActivateBlock(blockType: String,
                         name: String = "",
                         identity: String = "",
                         override val origin: Point = Point(),
                         size: Size = Size(),
                         flip: Boolean = false,
                         theta: Double = 0.0,
                         backgroundColor: Color = Color.white,
                         foregroundColor: Color = Color.black,
                         inputCount: Int = 0,
                         outputCount: Int = 0,
                         eventInputCount: Int = 0,
                         eventOutputCount: Int = 0,
                         parameters: ActivateStruct = ActivateStruct.empty) extends Block {

  def toExpression(path: String): Seq[Expression] = generators.dispatch(this, path)
}

case class ActivateSuperBlock(name: String = "",
                              identity: String = "",
                              origin: Point = Point(),
                              size: Size = Size(),
                              flip: Boolean = false,
                              theta: Double = 0.0,
                              backgroundColor: Color = Color.white,
                              foregroundColor: Color = Color.black,
                              inputCount: Int = 0,
                              outputCount: Int = 0,
                              eventInputCount: Int = 0,
                              eventOutputCount: Int = 0,
                              diagram: Option[Diagram] = None,
                              atomic: Boolean = false) extends Block {

  override def toExpression(path: String): Seq[Expression] = {
    generators.SuperBlock.apply(path)(this)
  }
}
