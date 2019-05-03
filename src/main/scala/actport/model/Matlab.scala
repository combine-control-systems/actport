package actport.model

import actport.oml.ParsedSystem
import monocle.macros.syntax.lens._

import scala.annotation.tailrec

/** Matlab interface to database. */
object Matlab {
  /** Create a new data model.
    *
    * @param system parsed system to transform to data model
    * @return data model
    */
  def create_model(system: ParsedSystem): Model = Model(system)

  /** Get name of block.
    *
    * @param model   data model
    * @param blockId block identifier
    * @throws NoSuchElementException block is not present in model
    * @return name of block
    */
  @throws[NoSuchElementException]
  def get_name(model: Model, blockId: Long): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.name.name
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }

  /** Get Activate identifier of block.
    *
    * @param model   data model
    * @param blockId block identifier
    * @throws NoSuchElementException block is not present in model
    * @return Activate identifier
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_activate_id(model: Model, blockId: Long): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.activateId.id
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }

  /** Get children of block.
    *
    * @param model         data model
    * @param parentBlockId parent block identifier
    * @return array of block id:s which are children of the parent block
    */
  def get_children(model: Model, parentBlockId: Long): Array[Long] =
    model.blocks.values.filter(_.parent.contains(BlockId(parentBlockId))).map(_.id.id).toArray

  /** Get all block id:s.
    *
    * @param model data model
    * @return array of block id:s
    */
  def get_all_blocks(model: Model): Array[Long] = model.blocks.values.map(_.id.id).toArray

  /** Generate full path of a given block.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException if parent is not found
    * @return full path of block
    */
  @throws[NoSuchElementException]("if parent is not found")
  def get_path(model: Model, blockId: Long): String = {
    @tailrec
    def buildPath(b: Block, path: Vector[String] = Vector.empty): Vector[String] = {
      val newPath = b.name.name +: path
      b.parent match {
        case None => newPath // terminator
        case Some(parentId) =>
          model.blocks.values.find(_.id == parentId) match {
            case None => throw new NoSuchElementException(s"parent $parentId not found for block ${b.id}")
            case Some(parent) => buildPath(parent, newPath)
          }
      }
    }

    (model.blocks.values.find(_.id.id == blockId) match {
      case Some(block) => buildPath(block)
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }).mkString("/")
  }

  /** Get parameter value of block.
    *
    * @param model         data model
    * @param blockId       block id
    * @param parameterName parameter name
    * @param defaultValue  default parameter value if none found
    * @throws NoSuchElementException block is not present in model
    * @return parameter value
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_parameter(model: Model, blockId: Long, parameterName: String, defaultValue: Any): Any =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.parameters.getOrElse(ParameterName(parameterName), defaultValue)
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }

  /** Get block position.
    *
    * The result is returned as a string consumed by the Simulink API.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException block is not present in model
    * @return block position string
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_position(model: Model, blockId: Long): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) =>
        val p = block.appearance.position
        s"[${p.x},${p.y},${p.x + p.width},${p.y + p.height}]"
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }

  /** Get background color of block.
    *
    * The result is returned as a string consumed by the Simulink API.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException block is not present in model
    * @return block color
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_background_color(model: Model, blockId: Long): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) =>
        val c = block.appearance.backgroundColor.getColorComponents(null)
        s"[${c(0)},${c(1)},${c(2)}]"
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }

  /** Get foreground color of block.
    *
    * The result is returned as a string consumed by the Simulink API.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException block is not present in model
    * @return block color
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_foreground_color(model: Model, blockId: Long): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) =>
        val c = block.appearance.foregroundColor.getColorComponents(null)
        s"[${c(0)},${c(1)},${c(2)}]"
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }

  /** Get orientation of block.
    *
    * The result is returned as a string consumed by the Simulink API.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException block is not present in model
    * @return block orientation
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_orientation(model: Model, blockId: Long): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) =>
        val flip = block.appearance.flip
        val rotation = block.appearance.rotation
        (if (flip) rotation + 180 else rotation) % 360 match {
          case 90 => "down"
          case 180 => "left"
          case 270 => "up"
          case _ => "right"
        }
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }

  /** Count number of input ports.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException block is not present in model
    * @return number of input ports
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_input_count(model: Model, blockId: Long): Int =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.ports.explicitInputCount
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }


  /** Count number of connected output ports.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException block is not present in model
    * @return number of output ports
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_output_count(model: Model, blockId: Long): Int =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.ports.explicitOutputCount
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }

  /** Count number of connected event input ports.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException block is not present in model
    * @return number of event input ports
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_event_input_count(model: Model, blockId: Long): Int =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.ports.eventInputCount
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }

  /** Count number of connected event output ports.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException block is not present in model
    * @return number of event output ports
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_event_output_count(model: Model, blockId: Long): Int =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.ports.eventOutputCount
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }

  /** Map the event input port to its equivalent Simulink port.
    *
    * If there is no link involved in the mapping an unmodified model is returned.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @param simulinkPort name of Simulink port
    * @return updated data model
    */
  def map_event_input_port(model: Model, blockId: Long, activatePort: Int, simulinkPort: String): Model = {
    val link = model.links.values.find(link =>
      link.end.block.id == blockId &&
        link.linkType == EventLink &&
        link.end.activatePort.index == activatePort)
    // Update model with port mapping.
    link.map(l => model.lens(_.portMap).modify { pm =>
      val key = (l.end.block, l.end.activatePort, InputPort, l.linkType)
      val value = MappedPort(simulinkPort)
      pm + (key -> value)
    }).getOrElse(model)
  }

  /** Map the event output port to its equivalent Simulink port.
    *
    * If there is no link involved in the mapping an unmodified model is returned.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @param simulinkPort name of Simulink port
    * @return updated data model
    */
  def map_event_output_port(model: Model, blockId: Long, activatePort: Int, simulinkPort: String): Model = {
    val link = model.links.values.find(link =>
      link.start.block.id == blockId &&
        link.linkType == EventLink &&
        link.start.activatePort.index == activatePort)
    // Update model with port mapping.
    link.map(l => model.lens(_.portMap).modify { pm =>
      val key = (l.start.block, l.start.activatePort, OutputPort, l.linkType)
      val value = MappedPort(simulinkPort)
      pm + (key -> value)
    }).getOrElse(model)
  }

  /** Map the input port to its equivalent Simulink port.
    *
    * If there is no link involved in the mapping an unmodified model is returned.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @param simulinkPort name of Simulink port
    * @return updated data model
    */
  def map_input_port(model: Model, blockId: Long, activatePort: Int, simulinkPort: String): Model = {
    val link = model.links.values.find(link =>
      link.end.block.id == blockId &&
        link.linkType == ExplicitLink &&
        link.end.activatePort.index == activatePort)
    // Update model with port mapping.
    link.map(l => model.lens(_.portMap).modify { pm =>
      val key = (l.end.block, l.end.activatePort, InputPort, l.linkType)
      val value = MappedPort(simulinkPort)
      pm + (key -> value)
    }).getOrElse(model)
  }

  /** Map the output port to its equivalent Simulink port.
    *
    * If there is no link involved in the mapping an unmodified model is returned.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @param simulinkPort name of Simulink port
    * @return updated data model
    */
  def map_output_port(model: Model, blockId: Long, activatePort: Int, simulinkPort: String): Model = {
    val link = model.links.values.find(link =>
      link.start.block.id == blockId &&
        link.linkType == ExplicitLink &&
        link.start.activatePort.index == activatePort)
    // Update model with port mapping.
    link.map(l => model.lens(_.portMap).modify { pm =>
      val key = (l.start.block, l.start.activatePort, OutputPort, l.linkType)
      val value = MappedPort(simulinkPort)
      pm + (key -> value)
    }).getOrElse(model)
  }

  /** Set input port of block as illegal.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @return updated data model
    */
  def set_input_port_illegal(model: Model, blockId: Long, activatePort: Int): Model =
  // Find all links ending up at the specified port.
    model.links.values.filter(link =>
      link.end.block.id == blockId &&
        link.linkType == ExplicitLink &&
        link.end.activatePort.index == activatePort)
      // Set port mapping as invalid.
      .foldLeft(model) { (m, link) =>
        val key = (link.end.block, link.end.activatePort, InputPort, ExplicitLink)
        val value = InvalidPort
        m.lens(_.portMap).modify(_ + (key -> value))
      }

  /** Set input port of block as illegal.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @return updated data model
    */
  def set_output_port_illegal(model: Model, blockId: Long, activatePort: Int): Model =
  // Find all links starting up at the specified port.
    model.links.values.filter(link =>
      link.start.block.id == blockId &&
        link.linkType == ExplicitLink &&
        link.start.activatePort.index == activatePort)
      // Set port mapping as invalid.
      .foldLeft(model) { (m, link) =>
        val key = (link.start.block, link.start.activatePort, OutputPort, ExplicitLink)
        val value = InvalidPort
        m.lens(_.portMap).modify(_ + (key -> value))
      }

  /** Set evnt input port of block as illegal.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @return updated data model
    */
  def set_event_input_port_illegal(model: Model, blockId: Long, activatePort: Int): Model =
  // Find all links ending up at the specified port.
    model.links.values.filter(link => link.end.block.id == blockId &&
      link.linkType == EventLink &&
      link.end.activatePort.index == activatePort)
      // Set port mapping as invalid.
      .foldLeft(model) { (m, link) =>
        val key = (link.end.block, link.end.activatePort, InputPort, EventLink)
        val value = InvalidPort
        m.lens(_.portMap).modify(_ + (key -> value))
      }

  /** Set input port of block as illegal.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @return updated data model
    */
  def set_event_output_port_illegal(model: Model, blockId: Long, activatePort: Int): Model =
  // Find all links ending up at the specified port.
    model.links.values.filter(link => link.start.block.id == blockId &&
      link.linkType == EventLink &&
      link.start.activatePort.index == activatePort)
      // Set port mapping as invalid.
      .foldLeft(model) { (m, link) =>
        val key = (link.start.block, link.start.activatePort, OutputPort, EventLink)
        val value = InvalidPort
        m.lens(_.portMap).modify(_ + (key -> value))
      }

  /** Get array of link id:s.
    *
    * @param model         data model
    * @param parentBlockId parent block id
    * @return array of link id:s
    */
  def get_links(model: Model, parentBlockId: Long): Array[Long] =
    model.links.values.filter(_.parent.id == parentBlockId).map(_.id.id).toArray

  /** Get start block id for link.
    *
    * @param model  data model
    * @param linkId link id
    * @throws NoSuchElementException if the link is not found
    * @return block id
    */
  @throws[NoSuchElementException]("if the link is not found")
  def get_start_block(model: Model, linkId: Long): Long =
    model.links.get(LinkId(linkId)) match {
      case Some(link) => link.start.block.id
      case None => throw new NoSuchElementException(s"link with id $linkId not found")
    }

  /** Get end block id for link.
    *
    * @param model  data model
    * @param linkId link id
    * @throws NoSuchElementException if the link is not found
    * @return block id
    */
  @throws[NoSuchElementException]("if the link is not found")
  def get_end_block(model: Model, linkId: Long): Long =
    model.links.get(LinkId(linkId)) match {
      case Some(link) => link.end.block.id
      case None => throw new NoSuchElementException(s"link with id $linkId not found")
    }

  /** Get start Simulink port for link.
    *
    * @param model  data model
    * @param linkId link id
    * @throws NoSuchElementException if the link is not found
    * @throws IllegalStateException  if the port is invalid
    * @return block id
    */
  @throws[NoSuchElementException]("if the link is not found")
  @throws[IllegalStateException]("if the port is invalid")
  def get_start_port(model: Model, linkId: Long): String =
    model.links.get(LinkId(linkId)) match {
      case Some(link) =>
        val key = (link.start.block, link.start.activatePort, OutputPort, link.linkType)
        model.portMap.get(key) match {
          case Some(InvalidPort) => throw new IllegalStateException(s"link with id $linkId has an invalid start port")
          case Some(MappedPort(port)) => port
          case None => link.start.activatePort.index.toString
        }
      case None => throw new NoSuchElementException(s"link with id $linkId not found")
    }

  /** Get end Simulink port for link.
    *
    * @param model  data model
    * @param linkId link id
    * @throws NoSuchElementException if the link is not found
    * @throws IllegalStateException  if the port is invalid
    * @return block id
    */
  @throws[NoSuchElementException]("if the link is not found")
  @throws[IllegalStateException]("if the port is invalid")
  def get_end_port(model: Model, linkId: Long): String =
    model.links.get(LinkId(linkId)) match {
      case Some(link) =>
        val key = (link.end.block, link.end.activatePort, InputPort, link.linkType)
        model.portMap.get(key) match {
          case Some(InvalidPort) => throw new IllegalStateException(s"link with id $linkId has an invalid start port")
          case Some(MappedPort(port)) => port
          case None => link.end.activatePort.index.toString
        }
      case None => throw new NoSuchElementException(s"link with id $linkId not found")
    }

  /** Get mapped port of an event input port.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort Activate port index
    * @return mapped port, null if it is invalid
    */
  def get_mapped_event_input_port(model: Model, blockId: Long, activatePort: Int): String =
    model.portMap.get((BlockId(blockId), ActivatePort(activatePort), InputPort, EventLink)) match {
      case Some(InvalidPort) => null
      case Some(MappedPort(port)) => port
      case None => activatePort.toString
    }

  /** Get mapped port of an event output port.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort Activate port index
    * @return mapped port, null if it is invalid
    */
  def get_mapped_event_output_port(model: Model, blockId: Long, activatePort: Int): String =
    model.portMap.get((BlockId(blockId), ActivatePort(activatePort), OutputPort, EventLink)) match {
      case Some(InvalidPort) => null
      case Some(MappedPort(port)) => port
      case None => activatePort.toString
    }
}
