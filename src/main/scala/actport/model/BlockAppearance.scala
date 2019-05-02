package actport.model

import java.awt.{Color, Rectangle}

import actport.oml.ParsedEntity

case class BlockAppearance(position: Rectangle,
                           backgroundColor: Color,
                           foregroundColor: Color,
                           flip: Boolean,
                           rotation: Int)

object BlockAppearance {
  def apply(entity: ParsedEntity): BlockAppearance = {
    val position = {
      val x = entity.origin.x
      val y = -entity.origin.y - entity.size.height
      val w = entity.size.width
      val h = entity.size.height
      new Rectangle(x, y, w, h)
    }

    BlockAppearance(position, entity.backgroundColor, entity.foregroundColor, entity.flip, entity.theta.toInt)
  }

  def default: BlockAppearance = BlockAppearance(
    position = new Rectangle(0, 0, 32, 32),
    backgroundColor = Color.white,
    foregroundColor = Color.black,
    flip = false,
    rotation = 0
  )
}
