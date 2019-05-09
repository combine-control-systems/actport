package actport.oml

import java.awt.Color

/** Common properties of blocks in Activate. */
sealed trait ParsedEntity {
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

  def mask: Option[ActivateStruct]
}

/** Instance of block which is not a super block.
  *
  * @param blockType        Activate block type identifier
  * @param name             name of block
  * @param identity         block identity (purpose unknown)
  * @param origin           block origin coordinates
  * @param size             block size
  * @param flip             flips block
  * @param theta            rotates block in multiples of 90 degrees
  * @param backgroundColor  background color of block
  * @param foregroundColor  foreground color of block
  * @param inputCount       number of input ports
  * @param outputCount      number of output ports
  * @param eventInputCount  number of event input ports
  * @param eventOutputCount number of event output ports
  * @param parameters       block parameters
  */
case class ParsedBlock(blockType: String,
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
                       parameters: ActivateStruct = ActivateStruct.empty,
                       mask: Option[ActivateStruct] = None) extends ParsedEntity

/** Representation of a subsystem.
  *
  * @param name                  name of super block
  * @param identity              identity of super block (purpose unknown)
  * @param children              children
  * @param origin                coordinate of super block
  * @param size                  size of super block
  * @param flip                  flips block
  * @param theta                 rotates block
  * @param systemBackgroundColor background color of the system
  * @param backgroundColor       background color of super block
  * @param foregroundColor       foreground color of super block
  * @param inputCount            number of input ports
  * @param outputCount           number of output ports
  * @param eventInputCount       number of event input ports
  * @param eventOutputCount      number of event output ports
  * @param atomic                super block atomic or not
  */
case class ParsedSystem(name: String = "",
                        identity: String = "",
                        children: Vector[ParsedEntity] = Vector.empty,
                        origin: Point = Point(),
                        size: Size = Size(),
                        flip: Boolean = false,
                        theta: Double = 0.0,
                        zoom: Double = 1.0,
                        systemBackgroundColor: Color = Color.white,
                        backgroundColor: Color = Color.white,
                        foregroundColor: Color = Color.black,
                        inputCount: Int = 0,
                        outputCount: Int = 0,
                        eventInputCount: Int = 0,
                        eventOutputCount: Int = 0,
                        context: Option[String] = None,
                        explicitLinks: Vector[Link] = Vector.empty,
                        eventLinks: Vector[Link] = Vector.empty,
                        atomic: Boolean = false,
                        mask: Option[ActivateStruct] = None) extends ParsedEntity {

  val blockType = "Subsystem"
}
