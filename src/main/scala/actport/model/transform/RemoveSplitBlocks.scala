package actport.model.transform

import actport.model.{ActivateId, Block, Model}
import monocle.macros.syntax.lens._

import scala.util.chaining._

object RemoveSplitBlocks {
  /** Remove all split blocks and replace with equivalent links in Simulink.
    *
    * @param model system to process
    * @return transformed model
    */
  def apply(model: Model): Model =
    model.blocks.values.foldLeft(model) { (m, block) =>
      block.activateId match {
        case ActivateId("system/Links/Split") => removeSplitBlock(m, block)
        case ActivateId("system/Links/ActivationSplit") => removeSplitBlock(m, block)
        case ActivateId("system/Links/SplitN") => removeSplitBlock(m, block)
        case _ => m
      }
    }

  /** Remove split blocks from model.
    *
    * @param model data model
    * @param block split block
    * @return updated model
    */
  private def removeSplitBlock(model: Model, block: Block): Model = {
    // A split block has one source...
    val linkToBlock = model.links.values.find(_.end.block == block.id) match {
      case Some(link) => link
      case None => throw new IllegalStateException("incoming link to split block does not have a source block")
    }
    // ...and multiple destination links.
    val linksFromBlock = model.links.values.filter(_.start.block == block.id).toVector
    // Now it is time to remove the split block.
    model.lens(_.blocks).modify(_ - block.id)
      // Remove the incoming link.
      .pipe(_.lens(_.links).modify(_ - linkToBlock.id))
        // Modify the start of the destination links to be equal to the incoming link's start.
      .pipe(m => linksFromBlock.foldLeft(m) { (m, link) =>
        val updatedLink = link.lens(_.start).set(linkToBlock.start)
        m.lens(_.links).modify(_ + (updatedLink.id -> updatedLink))
      })
  }
}
