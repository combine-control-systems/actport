package actport.model.transform

import actport.model._
import monocle.macros.syntax.lens._

import scala.util.chaining._

object EliminateSampleClock {
  /** Eliminate sample clock from model by setting sample rate on blocks instead.
    *
    * @param model data model
    * @return updated data model
    */
  def apply(model: Model): Model = {
    // Find all SampleClock blocks.
    val sampleClockBlocks = model.blocks.values
      .filter(_.activateId == ActivateId("system/ActivationOperations/SampleClock"))

    sampleClockBlocks.foldLeft(model) { (m, block) => eliminateSampleClock(m, block) }
  }

  private def eliminateSampleClock(model: Model, sampleClock: Block): Model = {
    // Find all links leaving the SampleClock block.
    val outLinks = model.links.values
      .filter(link => link.start.block == sampleClock.id && link.linkType == EventLink)
    val collectedInfo = outLinks.foldLeft(CollectedInfo.empty) {
      (ci, link) => ci + findTerminalBlock(model, link)
    }
    // Set sample time on all blocks.
    collectedInfo.blocks.foldLeft(model) { (m, b) =>
      val sampleRate = sampleClock.parameters.get(ParameterName("frequ")) match {
        case Some(f) => f.toString
        case _ => "-1"  // Inherited sample rate.
      }
      m.lens(_.blocks).modify(_ + (b.id -> b.lens(_.sampleRate).set(Some(sampleRate))))
    }.pipe { m =>
      // Delete all involved links.
      outLinks.foldLeft(m) { (m, link) => m.lens(_.links).modify(_ - link.id) }
    }.pipe { m =>
      // Delete sample clock block.
      m.lens(_.blocks).modify(_ - sampleClock.id)
    }
  }

  case class CollectedInfo(blocks: Vector[Block] = Vector.empty,
                           links: Vector[Link] = Vector.empty,
                           blocksToRemove: Vector[Block] = Vector.empty) {
    def +(c: CollectedInfo): CollectedInfo = CollectedInfo(blocks ++ c.blocks,
      links ++ c.links, blocksToRemove ++ c.blocksToRemove)
  }

  object CollectedInfo {
    def empty: CollectedInfo = CollectedInfo()
  }

  private def findTerminalBlock(model: Model, link: Link): CollectedInfo = {
    model.blocks.values.find(_.id == link.end.block) match {
      // If the link is connected to a subsystem we continue searching
      // from the event input.
      case Some(block) if block.activateId == ActivateId("Subsystem") =>

        // Find input port.
        model.blocks.values.foldLeft(CollectedInfo.empty) { (collectedInfo: CollectedInfo, b: Block) =>
          // Look for matching event inputs.
          if (b.parent.contains(block.id) &&
            b.activateId == ActivateId("system/Ports/EventInput") &&
            // The event ort must match the link.
            b.parameters.get(ParameterName("portNumber")).contains(link.end.activatePort.index)) {

            collectedInfo
              // Add the block (which is an event input) to the list of blocks to remove.
              .lens(_.blocksToRemove).modify(_ :+ b)
              .pipe { ci =>
                // Find all links leaving the event input.
                model.links.values
                  .filter(_.start.block == b.id)
                  .foldLeft(ci) { (ci, l) =>
                    // Add the link and other downstream links with any terminal blocks.
                    ci.lens(_.links).modify(_ :+ l)
                      .pipe(_ + findTerminalBlock(model, l))
                  }
              }

          } else collectedInfo
        }

      // We might have found a terminal block.
      case Some(block) => CollectedInfo(blocks = Vector(block), links = Vector(link))

      // Nothing found.
      case _ => CollectedInfo.empty
    }
  }
}
