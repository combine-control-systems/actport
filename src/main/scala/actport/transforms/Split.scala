package actport.transforms

import actport._

import scala.util.chaining._

/** Transform to eliminate all split blocks in Activate model.
  *
  * The function [[Split.eliminateSplitBlocks]] removes all split
  * blocks and replaces them with links instead to match the
  * representation in Simulink.
  */
object Split {
  /** Eliminate all split blocks with links.
    *
    * @param subsystem Diagram object
    * @return updated Diagram
    */
  def eliminateSplitBlocks(subsystem: System): System = {
    subsystem.children.foldLeft(subsystem) { (ss, child) =>
      child match {

        // Eliminate split blocks.
        case block: Block if block.blockType == "system/Links/Split" =>
          eliminateSplitBlock(ss, block, ExplicitLink)

        // Eliminate event split blocks.
        case block: Block if block.blockType == "system/Links/EventSplit" =>
          eliminateSplitBlock(ss, block, EventLink)

        // Also do this recursively for super block children.
        case superBlock: System =>
          val index = ss.children.indexOf(superBlock)
          if (index == -1) throw new RuntimeException("SuperBlock did not exist among children.")
          val updatedChildren = ss.children
            // Update the SuperBlock with a new Diagram with all Split blocks eliminated.
            .updated(index, eliminateSplitBlocks(superBlock))
          // Update the list of children.
          ss.copy(children = updatedChildren)

        // Do nothing.
        case _ => ss
      }
    }
  }

  /** Eliminate split block with links.
    *
    * There is no equivalent of split blocks in Simulink.
    *
    * @param subsystem Subsystem object
    * @param block     Split block object
    * @return updated Diagram
    */
  private def eliminateSplitBlock(subsystem: System, block: Block, linkType: LinkType): System = {
    require(block.blockType == "system/Links/Split" ||
      block.blockType == "system/Links/EventSplit", "Can only eliminate splits for Split or EventSplit blocks.")

    // There is should be only one link incoming.
    val incoming: Option[Link] = linkType match {
      case ExplicitLink => subsystem.explicitLinks.find(_.destination == block.name)
      case EventLink => subsystem.eventLinks.find(_.destination == block.name)
      case ImplicitLink => throw new NotImplementedError()
    }
    // But there may be several outgoing links.
    val outgoing: Seq[Link] = linkType match {
      case ExplicitLink => subsystem.explicitLinks.filter(_.start == block.name)
      case EventLink => subsystem.eventLinks.filter(_.start == block.name)
      case ImplicitLink => throw new NotImplementedError()
    }

    // Create new links between the incoming start port and all of the outgoing destination ports.
    val newLinks = incoming.map { i: Link =>
      outgoing.map { o: Link => Link(i.start, i.startPort, o.destination, o.destinationPort, linkType, Vector.empty) }
    }

    (newLinks match {
      case Some(links) =>
        // Remove the old links and add the new ones.
        linkType match {
          case ExplicitLink =>
            // Remove old links.
            val filteredLinks = subsystem.explicitLinks
              .filter { l: Link => l.destination != block.name && l.start != block.name }
            // Set subsystem links to filtered links and the new links replacing the old ones.
            subsystem.copy(explicitLinks = filteredLinks ++ links)

          // Same procedure for event links.
          case EventLink =>
            val filteredLinks = subsystem.eventLinks
              .filter { l: Link => l.destination != block.name && l.start != block.name }
            subsystem.copy(eventLinks = filteredLinks ++ links)

          case ImplicitLink =>
            throw new NotImplementedError()
        }
      case None =>
        // Do nothing if there is nothing to do.
        subsystem

      // Finally remove the Split block from the children of the subsystem.
    }).pipe { ss => ss.copy(children = ss.children.filter(_ != block)) }
  }
}
