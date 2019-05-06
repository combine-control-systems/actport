package actport.model

import actport.oml
import actport.oml.{ActivateStruct, ParsedBlock, ParsedSystem}
import monocle.macros.syntax.lens._

import scala.util.chaining._

case class Model(blocks: Map[BlockId, Block] = Map.empty,
                 links: Map[LinkId, Link] = Map.empty,
                 portMap: Map[(BlockId, ActivatePort, PortType, LinkType), SimulinkPort] = Map.empty)

object Model {
  /** Convert a system to a model.
    *
    * @param parsedRoot root system to convert
    * @return model
    */
  def apply(parsedRoot: ParsedSystem): Model = {
    // Simplify a bit by not having the id counters as mutable values.
    var blockIdCounter = BlockId(0)
    var linkIdCounter = LinkId(0)

    val root = Block(BlockId(0), None, BlockName(parsedRoot.name), ActivateId(parsedRoot.blockType),
      BlockAppearance(parsedRoot), ActivatePortInfo(parsedRoot))

    def walkTree(system: ParsedSystem, parentId: BlockId, model: Model = Model()): Model = {

      system.children.foldLeft(model) {

        case (m, pb: ParsedBlock) =>
          blockIdCounter = BlockId(blockIdCounter.id + 1)
          val block = Block(blockIdCounter, Some(parentId), BlockName(pb.name), ActivateId(pb.blockType),
            BlockAppearance(pb), ActivatePortInfo(pb), convertParameters(pb.parameters))
          m.lens(_.blocks).modify(_ + (block.id -> block))

        case (m, ps: ParsedSystem) =>
          blockIdCounter = BlockId(blockIdCounter.id + 1)
          val block = Block(blockIdCounter, Some(parentId), BlockName(ps.name), ActivateId(ps.blockType),
            BlockAppearance(ps), ActivatePortInfo(ps))
          // Add the block to the model.
          m.lens(_.blocks).modify(_ + (block.id -> block))
            // Add the children to the model.
            .pipe(m => walkTree(ps, block.id, m))

      }.pipe { m =>
        // Add links to the model.

        // Now when we have added all children to the model it is possible to identify the blocks
        // involved in the connections.
        val blocks = m.blocks.values.filter(_.parent.contains(parentId)).toVector

        // First we handle the explicit links.
        val explicitLinks = system.explicitLinks.foldLeft(Map.empty[LinkId, Link]) {
          case (state, link) =>
            linkIdCounter = LinkId(linkIdCounter.id + 1)
            linkFolder(linkIdCounter, parentId, blocks, ExplicitLink, state, link)
        }
        // Then we handle the event links.
        val eventLinks = system.eventLinks.foldLeft(Map.empty[LinkId, Link]) {
          case (state, link) =>
            linkIdCounter = LinkId(linkIdCounter.id + 1)
            linkFolder(linkIdCounter, parentId, blocks, EventLink, state, link)
        }
        m.lens(_.links).modify(_ ++ explicitLinks ++ eventLinks)
      }
    }

    // Build model.
    Model(blocks = Map(root.id -> root))
        .pipe(m => walkTree(parsedRoot, root.id, m))
  }

  private def linkFolder(linkIdCounter: LinkId, parentId: BlockId, blocks: Vector[Block], linkType: LinkType,
                         state: Map[LinkId, Link], link: oml.Link): Map[LinkId, Link] = {
    val startBlock = blocks.find(_.name == BlockName(link.start))
    val endBlock = blocks.find(_.name == BlockName(link.destination))

    (startBlock, endBlock) match {
      case (Some(start), Some(end)) =>
        val linkStart = LinkStart(start.id, ActivatePort(link.startPort))
        val linkEnd = LinkEnd(end.id, ActivatePort(link.destinationPort))
        state + (linkIdCounter -> Link(linkIdCounter, parentId, linkType, linkStart, linkEnd))
      case _ => state
    }
  }

  private def convertParameters(struct: ActivateStruct): BlockParameters = {

    import scala.collection.JavaConverters._

    def walkStruct(s: ActivateStruct, path: Vector[String] = Vector.empty,
                   blockParameters: BlockParameters = Map.empty): BlockParameters = {
      s.asScala.foldLeft(blockParameters) {
        case (p, (k, v)) =>
          val parName = ParameterName((path :+ k).mkString("/"))
          v match {
            case x: ActivateStruct => walkStruct(x, path :+ k, p)
            case x => p + (parName -> x)
          }
      }
    }

    walkStruct(struct)
  }
}
