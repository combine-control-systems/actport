package actport

import java.awt.{Color, Rectangle}

import actport.simulink.{Expression, SimulinkPath}

/** Common properties of blocks in Activate. */
sealed trait Block {
  /** Name of block. */
  def name: String

  /** Identity of block. Purpose unknown. */
  def identity: String

  /** Origin coordinates of block. */
  def origin: Point

  /** Block size. */
  def size: Size

  /** Flips block horizontally if true. */
  def flip: Boolean

  /** Block rotation angle. */
  def theta: Double

  /** Background color of block. */
  def backgroundColor: Color

  /** Foreground color of block. */
  def foregroundColor: Color

  /** Number of input ports of block. */
  def inputCount: Int

  /** Number of output ports of block. */
  def outputCount: Int

  /** Number of event input ports of block. */
  def eventInputCount: Int

  /** Number of event output ports of block. */
  def eventOutputCount: Int

  /** Generates a rectangle in Activate coordinates based on [[origin]] and [[size]]. */
  def rect: Rectangle = new Rectangle(origin.x, origin.y, size.width, size.height)

  /** Converts block to a collection of expressions which can be serialized to Matlab code.
    *
    * @param path location of block in diagram
    */
  def toExpression(path: SimulinkPath): Seq[Expression]
}

/** Instance of block which is not a super block.
  *
  * @param blockType        Activate block type identifier
  * @param name             name of block
  * @param identity         block identity (purpose unknown)
  * @param origin           block origin coordinates
  * @param size             block size
  * @param flip             flips block
  * @param theta            rotates block
  * @param backgroundColor  background color of block
  * @param foregroundColor  foreground color of block
  * @param inputCount       number of input ports
  * @param outputCount      number of output ports
  * @param eventInputCount  number of event input ports
  * @param eventOutputCount number of event output ports
  * @param parameters       block parameters
  */
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

  /** Converts Activate block to a sequence of expressions.
    *
    * @param path location of block in diagram
    * @return sequence of expressions to instantiate Activate block equivalent in Simulink
    */
  def toExpression(path: SimulinkPath): Seq[Expression] = generators.dispatch(path)(this)
}

/** Instance of super block in Activate.
  *
  * @param name             name of super block
  * @param identity         identity of super block (purpose unknown)
  * @param origin           coordinate of super block
  * @param size             size of super block
  * @param flip             flips block
  * @param theta            rotates block
  * @param backgroundColor  background color of super block
  * @param foregroundColor  foreground color of super block
  * @param inputCount       number of input ports
  * @param outputCount      number of output ports
  * @param eventInputCount  number of event input ports
  * @param eventOutputCount number of event output ports
  * @param diagram          diagram contained in super block
  * @param atomic           super block atomic or not
  */
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

  /** Converts Activate super block to a sequence of expressions.
    *
    * @param path location of block in diagram
    * @return sequence of expressions to instantiate Activate super block equivalent in Simulink
    */
  override def toExpression(path: SimulinkPath): Seq[Expression] = {
    generators.SuperBlock.apply(path)(this)
  }
}
