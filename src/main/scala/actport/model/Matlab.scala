package actport.model

import actport.oml.ParsedSystem
import monocle.macros.syntax.lens._

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
    // Update model with the modified link.
    link.map(_.lens(_.end.simulinkPort).set(Some(SimulinkPort(simulinkPort)))) match {
      case Some(l) => model.lens(_.links).modify(_ + (l.id -> l))
      case None => model
    }
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
    // Update model with the modified link.
    link.map(_.lens(_.start.simulinkPort).set(Some(SimulinkPort(simulinkPort)))) match {
      case Some(l) => model.lens(_.links).modify(_ + (l.id -> l))
      case None => model
    }
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
    // Update model with the modified link.
    link.map(_.lens(_.end.simulinkPort).set(Some(SimulinkPort(simulinkPort)))) match {
      case Some(l) => model.lens(_.links).modify(_ + (l.id -> l))
      case None => model
    }
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
    // Update model with the modified link.
    link.map(_.lens(_.start.simulinkPort).set(Some(SimulinkPort(simulinkPort)))) match {
      case Some(l) => model.lens(_.links).modify(_ + (l.id -> l))
      case None => model
    }
  }

  /** Get array of link id:s.
    *
    * @param model data model
    * @param parentBlockId parent block id
    * @return array of link id:s
    */
  def get_links(model: Model, parentBlockId: Long): Array[Long] =
    model.links.values.filter(_.parent.id == parentBlockId).map(_.id.id).toArray

  /** Get start block id for link.
    *
    * @param model data model
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
    * @param model data model
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
    * @param model data model
    * @param linkId link id
    * @throws NoSuchElementException if the link is not found
    * @return block id
    */
  @throws[NoSuchElementException]("if the link is not found")
  def get_start_port(model: Model, linkId: Long): String =
    model.links.get(LinkId(linkId)) match {
      case Some(link) => link.start.simulinkPort.map(_.name).getOrElse(link.start.activatePort.index.toString)
      case None => throw new NoSuchElementException(s"link with id $linkId not found")
    }

  /** Get end Simulink port for link.
    *
    * @param model data model
    * @param linkId link id
    * @throws NoSuchElementException if the link is not found
    * @return block id
    */
  @throws[NoSuchElementException]("if the link is not found")
  def get_end_port(model: Model, linkId: Long): String =
    model.links.get(LinkId(linkId)) match {
      case Some(link) => link.end.simulinkPort.map(_.name).getOrElse(link.end.activatePort.index.toString)
      case None => throw new NoSuchElementException(s"link with id $linkId not found")
    }
}
