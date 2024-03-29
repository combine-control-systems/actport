package actport.model

import actport.oml
import actport.oml.{ActivateStruct, ParsedBlock, ParsedSystem}
import monocle.macros.syntax.lens._

import scala.util.chaining._

case class Model(blocks: Map[BlockId, Block] = Map.empty,
                 links: Map[LinkId, Link] = Map.empty,
                 portMap: Map[(BlockId, ActivatePort, PortType, LinkType), SimulinkPort] = Map.empty,
                 solverSettings: SolverSettings = SolverSettings.default) {

  /** Create a mapped port.
    *
    * Supposed to be used from [[actport.model.Matlab.map_input_port]],
    * [[actport.model.Matlab.map_output_port]],
    * [[actport.model.Matlab.map_event_input_port]], and
    * [[actport.model.Matlab.map_event_output_port]].
    *
    * @param blockId      block id
    * @param activatePort index of activate port
    * @param simulinkPort simulink port
    * @param linkType     type of link
    * @param portType     type of port
    * @return mapped port
    */
  def addPortMapping(blockId: BlockId,
                     activatePort: ActivatePort,
                     simulinkPort: SimulinkPort,
                     linkType: LinkType,
                     portType: PortType): Model = {
    // Find matching link.
    val link: Option[Link] = this.links.values.find(link =>
      portType match {
        // Depends on the direction of the link relative to the block.
        case InputPort =>
          link.end.block == blockId &&
          link.linkType == linkType &&
          link.end.activatePort == activatePort
        case OutputPort =>
          link.start.block == blockId &&
          link.linkType == linkType &&
          link.start.activatePort == activatePort
      })
    // Update model with port mapping.
    // We must use map since link is Option[Link].
    link.map(l => this.lens(_.portMap).modify { pm =>
      val key = portType match {
        case InputPort => (l.end.block, l.end.activatePort, portType, linkType)
        case OutputPort => (l.start.block, l.start.activatePort, portType, linkType)
      }
      pm + (key -> simulinkPort)
    }).getOrElse(this)
  }
}

object Model {
  /** Convert a system to a model.
    *
    * @param parsedRoot root system to convert
    * @return model
    */
  def apply(parsedRoot: ParsedSystem): Model = {
    // Simplify the state a bit by not having the id counters as mutable values.
    var blockIdCounter = BlockId(0)
    var linkIdCounter = LinkId(0)

    // Root block.
    val root = Block(BlockId(0), None, BlockName(parsedRoot.name), ActivateId(parsedRoot.blockType),
      BlockAppearance(parsedRoot), ActivatePortInfo(parsedRoot), context = parsedRoot.context)
      .pipe(MaskBlock(parsedRoot))

    def walkTree(system: ParsedSystem, parentId: BlockId, model: Model = Model()): Model = {

      system.children.foldLeft(model) {
        // Add blocks to the model.

        case (m, pb: ParsedBlock) =>
          blockIdCounter = BlockId(blockIdCounter.value + 1)
          val block = Block(blockIdCounter, Some(parentId), BlockName(pb.name), ActivateId(pb.blockType),
            BlockAppearance(pb), ActivatePortInfo(pb), convertParameters(pb.parameters))
              .pipe(MaskBlock(pb))
          // Add the block to the model.
          m.lens(_.blocks).modify(_ + (block.id -> block))

        case (m, ps: ParsedSystem) =>
          blockIdCounter = BlockId(blockIdCounter.value + 1)
          val block = Block(blockIdCounter, Some(parentId), BlockName(ps.name), ActivateId(ps.blockType),
            BlockAppearance(ps), ActivatePortInfo(ps), context = ps.context)
              .pipe(MaskBlock(ps))
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
            linkIdCounter = LinkId(linkIdCounter.value + 1)
            linkFolder(linkIdCounter, parentId, blocks, ExplicitLink, state, link)
        }
        // Then we handle the event links.
        val eventLinks = system.eventLinks.foldLeft(Map.empty[LinkId, Link]) {
          case (state, link) =>
            linkIdCounter = LinkId(linkIdCounter.value + 1)
            linkFolder(linkIdCounter, parentId, blocks, EventLink, state, link)
        }
        // And the implicit links.
        val implicitLinks = system.implicitLinks.foldLeft(Map.empty[LinkId, Link]) {
          case (state, link) =>
            linkIdCounter = LinkId(linkIdCounter.value + 1)
            linkFolder(linkIdCounter, parentId, blocks, ImplicitLink, state, link)
        }
        m.lens(_.links).modify(_ ++ explicitLinks ++ eventLinks ++ implicitLinks)
      }
    }

    // Build model.
    // First add the root block.
    Model(blocks = Map(root.id -> root))
      // Continue with children.
      .pipe(m => walkTree(parsedRoot, root.id, m))
      .pipe(solverSettings(parsedRoot))
  }

  /** Folding function for links.
    *
    * @param linkIdCounter current ID-counter for links
    * @param parentId      parent block id
    * @param blocks        blocks in the current context
    * @param linkType      type of link
    * @param state         dictionary of links
    * @param link          link from OML-model
    * @return updated dictionary of links
    */
  private def linkFolder(linkIdCounter: LinkId, parentId: BlockId, blocks: Vector[Block], linkType: LinkType,
                         state: Map[LinkId, Link], link: oml.Link): Map[LinkId, Link] = {
    val startBlock = blocks.find(_.name == BlockName(link.start))
    val endBlock = blocks.find(_.name == BlockName(link.destination))

    (startBlock, endBlock) match {
      case (Some(start), Some(end)) =>
        val linkStart = LinkStart(start.id, ActivatePort(link.startPort))
        val linkEnd = LinkEnd(end.id, ActivatePort(link.destinationPort))
        // Add link to the dictionary of links.
        state + (linkIdCounter -> Link(linkIdCounter, parentId, linkType, linkStart, linkEnd))
      case _ => state
    }
  }

  /** Convert parameter dictionary to flat structure.
    *
    * The BlockParameters structure is a flattened structure
    * where hierarchical parameters are written as keys as
    * "par1/par2/par3" instead of using nested maps.
    *
    * @param struct raw Activate structure
    * @return converted structure
    */
  private def convertParameters(struct: ActivateStruct): BlockParameters = {

    import scala.collection.JavaConverters._

    def walkStruct(s: ActivateStruct, path: Vector[String] = Vector.empty,
                   blockParameters: BlockParameters = Map.empty): BlockParameters = {
      s.asScala.foldLeft(blockParameters) {
        case (p, (k, v)) =>
          val parName = ParameterName((path :+ k).mkString("/"))
          v match {
            // Walk deeper.
            case x: ActivateStruct => walkStruct(x, path :+ k, p)
            // Found a leaf, add it to the dictionary.
            case x => p + (parName -> x)
          }
      }
    }

    walkStruct(struct)
  }

  /** Set solver settings.
    *
    * @param parsedSystem parsed system
    * @param model        data model
    * @return updated data model
    */
  private def solverSettings(parsedSystem: ParsedSystem)(model: Model): Model =
    model.lens(_.solverSettings).set(parsedSystem.solverSettings)
    // Ensure that the tolerance on time has a valid value.
    .pipe(_.lens(_.solverSettings.toleranceOnTime).modify(t => if (t == "-1") "10*128*eps" else t))
    // Correct default value for MaxStep.
    .pipe(_.lens(_.solverSettings.maxStepSize).modify(ss => if (ss == "-1" || ss == "0") "auto" else ss))
}
