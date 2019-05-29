package actport.model.transform

import actport.model.{BlockName, Model}
import monocle.macros.syntax.lens._

object CorrectInvalidBlockNames {
  /** Correct invalid characters in block names.
    *
    * @param model data model
    * @return updated data model
    */
  def apply(model: Model): Model = {
    // Start by updating all block names.
    model.blocks.foldLeft(model) { case (m, (blockId, block)) =>
      val updatedName = BlockName(block.name.value
        .replace("/", "_"))
      if (block.name != updatedName) {
        println(s"${block.name} -> $updatedName")
        m.lens(_.blocks).modify(_ + (blockId -> block.lens(_.name).set(updatedName)))
      } else m
    }
  }
}
