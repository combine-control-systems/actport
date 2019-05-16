package actport.model

import java.awt.{Color, Rectangle}

import actport.Configuration
import actport.oml.ParsedEntity

/** Container for block appearance properties.
  *
  * @param position        position and size of block
  * @param backgroundColor background color of block
  * @param foregroundColor foreground color of block
  * @param flip            flip block horizontally
  * @param rotation        rotation of block in multiples of 90 degrees
  */
case class BlockAppearance(position: Rectangle,
                           backgroundColor: Color,
                           foregroundColor: Color,
                           flip: Boolean,
                           rotation: Int)

object BlockAppearance {
  /** Create appearance from a parsed entity.
    *
    * @param entity the parsed entity
    * @return block appearance
    */
  def apply(entity: ParsedEntity): BlockAppearance = {
    val position = {
      val x = entity.origin.x
      // The y-axis of Activate has opposite sign compared to the Simulink canvas.
      val y = -entity.origin.y - entity.size.height
      val w = entity.size.width
      val h = entity.size.height
      new Rectangle(x, y, w, h)
    }

    BlockAppearance(position, entity.backgroundColor, entity.foregroundColor, entity.flip, entity.theta.toInt)
  }

  /** Create appearance with default values. */
  def default: BlockAppearance = BlockAppearance(
    position = new Rectangle(0, 0, Configuration.minimumWidth, Configuration.minimumHeight),
    backgroundColor = Color.white,
    foregroundColor = Color.black,
    flip = false,
    rotation = 0
  )
}
