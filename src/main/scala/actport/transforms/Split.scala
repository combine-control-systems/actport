package actport.transforms

import actport.{ActivateBlock, ActivateSuperBlock, Diagram, Link}

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
    * @param diagram Diagram object
    * @return updated Diagram
    */
  def eliminateSplitBlocks(diagram: Diagram): Diagram = {
    diagram.children.foldLeft(diagram) { (diagramState, child) =>
      child match {

        // Eliminate split blocks.
        case block: ActivateBlock if block.blockType == "system/Links/Split" =>
          eliminateSplitBlock(diagramState, block)

        // Also do this recursively for super block children.
        case superBlock: ActivateSuperBlock =>
          val index = diagramState.children.indexOf(superBlock)
          if (index == -1) throw new RuntimeException("SuperBlock did not exist among children.")
          val updatedChildren = diagramState.children
            // Update the SuperBlock with a new Diagram with all Split blocks eliminated.
            .updated(index, superBlock.copy(diagram = superBlock.diagram.map(eliminateSplitBlocks)))
          // Update the list of children.
          diagramState.copy(children = updatedChildren)

        // Do nothing.
        case _ => diagramState
      }
    }
  }

  /** Eliminate split block with links.
    *
    * There is no equivalent of split blocks in Simulink.
    *
    * @param diagram Diagram object
    * @param block   Split block object
    * @return updated Diagram
    */
  private def eliminateSplitBlock(diagram: Diagram, block: ActivateBlock): Diagram = {
    require(block.blockType == "system/Links/Split", "Can only eliminate splits for Split blocks.")

    // There is should be only one link incoming.
    val incoming = diagram.explicitLinks.find(_.destination == block.name)
    val outgoing = diagram.explicitLinks.filter(_.start == block.name)

    // Create new links.
    val newLinks = incoming.map { i =>
      outgoing.map { o => Link(i.start, i.startPort, o.destination, o.destinationPort, Vector.empty) }
    }

    (newLinks match {
      case Some(links) =>
        // Remove the old links and add the new ones.
        val filteredLinks = diagram.explicitLinks.filter { l => l.destination != block.name && l.start != block.name }
        diagram.copy(explicitLinks = filteredLinks ++ links)

      case None =>
        // Do nothing if there is nothing to do.
        diagram

      // Finally remove the Split block from the children of the diagram.
    }).pipe { d => d.copy(children = d.children.filter(_ != block)) }
  }
}
