package actport.model

import java.awt.Rectangle

import actport.oml.ParsedSystem
import monocle.macros.syntax.lens._

import scala.annotation.tailrec
import scala.util.chaining._

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
      case Some(block) => block.name.value
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
      case Some(block) => block.activateId.value
      case None => throw new NoSuchElementException(s"block with id $blockId not found")
    }

  /** Get children of block.
    *
    * @param model         data model
    * @param parentBlockId parent block identifier
    * @return array of block id:s which are children of the parent block
    */
  def get_children(model: Model, parentBlockId: Long): Array[Long] =
    model.blocks.values.filter(_.parent.contains(BlockId(parentBlockId))).map(_.id.value).toArray

  /** Get parent of block.
    *
    * @param model   data model
    * @param blockId block whose parent should be found
    * @throws NoSuchElementException if block is not found
    * @return parent block id, -1 if no parent
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_parent(model: Model, blockId: Long): Long =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.parent match {
        case Some(parentId) => parentId.value
        case None => -1L
      }
      case None => throw new NoSuchElementException(s"no block with id $blockId found")
    }

  /** Get all block id:s.
    *
    * @param model data model
    * @return array of block id:s
    */
  def get_all_blocks(model: Model): Array[Long] = model.blocks.values.map(_.id.value).toArray

  /** Generate full path of a given block.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException if parent is not found
    * @return full path of block
    */
  @throws[NoSuchElementException]("if parent is not found")
  def get_path(model: Model, blockId: Long): String = {
    // Tail recursive function to recursively create the full path of the block by searching for the root.
    @tailrec
    def buildPath(b: Block, path: Vector[String] = Vector.empty): Vector[String] = {
      // Prepend the name of the current block to the path.
      val newPath = b.name.value +: path
      b.parent match {
        case None => newPath // terminator
        case Some(parentId) =>
          model.blocks.get(parentId) match {
            case None => throw new NoSuchElementException(s"parent $parentId not found for block ${b.id}")
            case Some(parent) => buildPath(parent, newPath)
          }
      }
    }

    (model.blocks.get(BlockId(blockId)) match {
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

  /** Get all parameters of a block.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException block is not present in model
    * @return list of parameter values as key -> value
    */
  @throws[NoSuchElementException]("if the block is not found")
  def get_parameter_list(model: Model, blockId: Long): Array[Array[String]] =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.parameters.map {
        case (k, v: Array[Any]) => Array(k.value, v.value.map(_.toString).mkString(", "))
        case (k, v) if v == null => Array(k.value, "")
        case (k, v: Any) => Array(k.value, v.value.toString)
      }.toArray
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
  def map_event_input_port(model: Model, blockId: Long, activatePort: Int, simulinkPort: String): Model =
    model.addPortMapping(BlockId(blockId), ActivatePort(activatePort),
      MappedPort(simulinkPort), EventLink, InputPort)

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
  def map_event_output_port(model: Model, blockId: Long, activatePort: Int, simulinkPort: String): Model =
    model.addPortMapping(BlockId(blockId), ActivatePort(activatePort),
      MappedPort(simulinkPort), EventLink, OutputPort)

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
  def map_input_port(model: Model, blockId: Long, activatePort: Int, simulinkPort: String): Model =
    model.addPortMapping(BlockId(blockId), ActivatePort(activatePort),
      MappedPort(simulinkPort), ExplicitLink, InputPort)


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
  def map_output_port(model: Model, blockId: Long, activatePort: Int, simulinkPort: String): Model =
    model.addPortMapping(BlockId(blockId), ActivatePort(activatePort),
      MappedPort(simulinkPort), ExplicitLink, OutputPort)

  /** Map the implicit input port to its equivalent Simulink port.
    *
    * If there is no link involved in the mapping an unmodified model is returned.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @param simulinkPort name of Simulink port
    * @return updated data model
    */
  def map_implicit_input_port(model: Model, blockId: Long, activatePort: Int, simulinkPort: String): Model =
    model.addPortMapping(BlockId(blockId), ActivatePort(activatePort),
      MappedPort(simulinkPort), ImplicitLink, InputPort)

  /** Map the implicit output port to its equivalent Simulink port.
    *
    * If there is no link involved in the mapping an unmodified model is returned.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @param simulinkPort name of Simulink port
    * @return updated data model
    */
  def map_implicit_output_port(model: Model, blockId: Long, activatePort: Int, simulinkPort: String): Model =
    model.addPortMapping(BlockId(blockId), ActivatePort(activatePort),
      MappedPort(simulinkPort), ImplicitLink, OutputPort)

  /** Set input port of block as invalid.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @return updated data model
    */
  def set_input_port_invalid(model: Model, blockId: Long, activatePort: Int): Model =
  // Find all links ending up at the specified port.
    model.links.values.filter(link =>
      link.end.block.value == blockId &&
        link.linkType == ExplicitLink &&
        link.end.activatePort.value == activatePort)
      // Set port mapping as invalid.
      .foldLeft(model) { (m, link) =>
      val key = (link.end.block, link.end.activatePort, InputPort, ExplicitLink)
      val value = InvalidPort
      m.lens(_.portMap).modify(_ + (key -> value))
    }

  /** Set input port of block as invalid.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @return updated data model
    */
  def set_output_port_invalid(model: Model, blockId: Long, activatePort: Int): Model =
    model.addPortMapping(BlockId(blockId), ActivatePort(activatePort),
      InvalidPort, ExplicitLink, OutputPort)

  /** Set event input port of block as invalid.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @return updated data model
    */
  def set_event_input_port_invalid(model: Model, blockId: Long, activatePort: Int): Model =
    model.addPortMapping(BlockId(blockId), ActivatePort(activatePort),
      InvalidPort, EventLink, InputPort)

  /** Set event output port of block as invalid.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @return updated data model
    */
  def set_event_output_port_invalid(model: Model, blockId: Long, activatePort: Int): Model =
    model.addPortMapping(BlockId(blockId), ActivatePort(activatePort),
      InvalidPort, EventLink, OutputPort)

  /** Set evnt input port of block as invalid.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @return updated data model
    */
  def set_implicit_input_port_invalid(model: Model, blockId: Long, activatePort: Int): Model =
    model.addPortMapping(BlockId(blockId), ActivatePort(activatePort),
      InvalidPort, ImplicitLink, InputPort)

  /** Set input port of block as invalid.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort index of activate port
    * @return updated data model
    */
  def set_implicit_output_port_invalid(model: Model, blockId: Long, activatePort: Int): Model =
    model.addPortMapping(BlockId(blockId), ActivatePort(activatePort),
      InvalidPort, ImplicitLink, OutputPort)

  /** Get array of link id:s.
    *
    * @param model         data model
    * @param parentBlockId parent block id
    * @return array of link id:s
    */
  def get_links(model: Model, parentBlockId: Long): Array[Long] =
    model.links.values.filter(_.parent.value == parentBlockId).map(_.id.value).toArray

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
      case Some(link) => link.start.block.value
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
      case Some(link) => link.end.block.value
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
          case None => link.start.activatePort.value.toString
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
          case None => link.end.activatePort.value.toString
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
  def get_mapped_event_input_port(model: Model, blockId: Long, activatePort: Int): String = {
    val key = (BlockId(blockId), ActivatePort(activatePort), InputPort, EventLink)
    model.portMap.get(key) match {
      case Some(InvalidPort) => null
      case Some(MappedPort(port)) => port
      case None => activatePort.toString
    }
  }

  /** Get mapped port of an event output port.
    *
    * @param model        data model
    * @param blockId      block id
    * @param activatePort Activate port index
    * @return mapped port, null if it is invalid
    */
  def get_mapped_event_output_port(model: Model, blockId: Long, activatePort: Int): String = {
    val key = (BlockId(blockId), ActivatePort(activatePort), OutputPort, EventLink)
    model.portMap.get(key) match {
      case Some(InvalidPort) => null
      case Some(MappedPort(port)) => port
      case None => activatePort.toString
    }
  }

  /** Rotate block 90 degrees clockwise.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException if block does not exist
    * @return updated model
    */
  @throws[NoSuchElementException]("if block does not exist")
  def rotate_clockwise(model: Model, blockId: Long): Model =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) =>
        block.lens(_.appearance.rotation).modify(r => (r + 90) % 360)
          .pipe(b => model.lens(_.blocks).modify(_ + (b.id -> b)))
      case None => throw new NoSuchElementException(s"could not find block with id $blockId")
    }

  /** Rotate block 90 degrees counter clockwise.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException if block does not exist
    * @return updated model
    */
  @throws[NoSuchElementException]("if the block does not exist")
  def rotate_counter_clockwise(model: Model, blockId: Long): Model =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) =>
        block.lens(_.appearance.rotation).modify(r => (r - 90) % 360)
          .pipe(b => model.lens(_.blocks).modify(_ + (b.id -> b)))
      case None => throw new NoSuchElementException(s"could not find block with id $blockId")
    }

  /** Swap width and height fields of block.
    *
    * @see rotate_clockwise - use together with 90 degree rotation.
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException if block does not exist
    * @return updated model
    */
  @throws[NoSuchElementException]("if block does not exist")
  def swap_width_and_height(model: Model, blockId: Long): Model =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) =>
        block.lens(_.appearance.position).modify(p => new Rectangle(p.x, p.y, p.height, p.width))
          .pipe(b => model.lens(_.blocks).modify(_ + (b.id -> b)))
      case None => throw new NoSuchElementException(s"could not find block with id $blockId")
    }

  /** Get sample rate of block.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException if block does not exist
    * @return sample time or empty string if no sample time is defined
    */
  @throws[NoSuchElementException]("if block does not exist")
  def get_sample_rate(model: Model, blockId: Long): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.sampleRate.getOrElse("-1")
      case None => throw new NoSuchElementException(s"could not find block with id $blockId")
    }

  /** Get block context.
    *
    * The context contains initialization code for a subsystem.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException if block does not exist
    * @return block context or empty string if no context is defined
    */
  @throws[NoSuchElementException]("if block does not exist")
  def get_context(model: Model, blockId: Long): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.context.getOrElse("")
      case None => throw new NoSuchElementException(s"could not find block with id $blockId")
    }

  /** Get an array of parameters in the mask.
    *
    * @param model   data model
    * @param blockId block id
    * @throws NoSuchElementException if block does not exist
    * @return array of parameter names or an empty array if there is no mask
    */
  @throws[NoSuchElementException]("if block does not exist")
  def get_mask_parameters(model: Model, blockId: Long): Array[String] =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.mask.keys.map(_.value).toArray
      case None => throw new NoSuchElementException(s"could not find block with id $blockId")
    }

  /** Get the value of a mask parameter.
    *
    * @param model         data model
    * @param blockId       block id
    * @param parameterName parameter name
    * @throws NoSuchElementException if block does not exist
    * @throws NoSuchFieldException   if parameter cannot be found
    * @return the string stored as a value
    */
  @throws[NoSuchElementException]("if block does not exist")
  @throws[NoSuchFieldException]("if parameter cannot be found")
  def get_mask_value(model: Model, blockId: Long, parameterName: String): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.mask.get(MaskParameterName(parameterName)) match {
        case Some(mask) => mask.value
        case None => throw new NoSuchFieldException(s"could not find value of mask parameter $parameterName " +
          s"of block $blockId")
      }
      case None => throw new NoSuchElementException(s"could not find block with id $blockId")
    }

  /** Get the parameter prompt of a mask parameter.
    *
    * @param model         data model
    * @param blockId       block id
    * @param parameterName parameter name
    * @throws NoSuchElementException if block does not exist
    * @throws NoSuchFieldException   if parameter cannot be found
    * @return parameter prompt
    */
  @throws[NoSuchElementException]("if block does not exist")
  @throws[NoSuchFieldException]("if parameter cannot be found")
  def get_mask_prompt(model: Model, blockId: Long, parameterName: String): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.mask.get(MaskParameterName(parameterName)) match {
        case Some(mask) => mask.prompt
        case None => throw new NoSuchFieldException(s"could not find prompt of mask parameter $parameterName " +
          s"block $blockId")
      }
      case None => throw new NoSuchElementException(s"could not find block with id $blockId")
    }

  /** Find out if the parameter should be evaluated.
    *
    * @param model         data model
    * @param blockId       block id
    * @param parameterName parameter name
    * @throws NoSuchElementException if block does not exist
    * @throws NoSuchFieldException   if parameter cannot be found
    * @return true if the parameter should be evaluated
    */
  @throws[NoSuchElementException]("if block does not exist")
  @throws[NoSuchFieldException]("if parameter cannot be found")
  def get_mask_evaluate(model: Model, blockId: Long, parameterName: String): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.mask.get(MaskParameterName(parameterName)) match {
        case Some(mask) => if (mask.evaluate) "on" else "off"
        case None => throw new NoSuchFieldException(s"could not find mask parameter $parameterName " +
          s"of block $blockId")
      }
      case None => throw new NoSuchElementException(s"could not find block with id $blockId")
    }

  /** Find out if the parameter should be enabled.
    *
    * @param model         data model
    * @param blockId       block id
    * @param parameterName parameter name
    * @throws NoSuchElementException if block does not exist
    * @throws NoSuchFieldException   if parameter cannot be found
    * @return true if the parameter should be enabled
    */
  @throws[NoSuchElementException]("if block does not exist")
  @throws[NoSuchFieldException]("if parameter cannot be found")
  def get_mask_enabled(model: Model, blockId: Long, parameterName: String): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.mask.get(MaskParameterName(parameterName)) match {
        case Some(mask) => if (mask.enable) "on" else "off"
        case None => throw new NoSuchFieldException(s"could not find mask parameter $parameterName " +
          s"of block $blockId")
      }
      case None => throw new NoSuchElementException(s"could not find block with id $blockId")
    }

  /** Find out if the parameter should be visible.
    *
    * @param model         data model
    * @param blockId       block id
    * @param parameterName parameter name
    * @throws NoSuchElementException if block does not exist
    * @throws NoSuchFieldException   if parameter cannot be found
    * @return true if the parameter should be visible
    */
  @throws[NoSuchElementException]("if block does not exist")
  @throws[NoSuchFieldException]("if parameter cannot be found")
  def get_mask_visible(model: Model, blockId: Long, parameterName: String): String =
    model.blocks.get(BlockId(blockId)) match {
      case Some(block) => block.mask.get(MaskParameterName(parameterName)) match {
        case Some(mask) => if (mask.visible) "on" else "off"
        case None => throw new NoSuchFieldException(s"could not find mask parameter $parameterName " +
          s"of block $blockId")
      }
      case None => throw new NoSuchElementException(s"could not find block with id $blockId")
    }

  /** Get the initial simulation time from the model.
    *
    * @param model data model
    * @return initial simulation time
    */
  def get_initial_time(model: Model): String = model.solverSettings.initialTime

  /** Get the final simulation time from the model.
    *
    * @param model data model
    * @return final simulation time
    */
  def get_final_time(model: Model): String = model.solverSettings.finalTime

  /** Get absolute tolerance setting.
    *
    * @param model data model
    * @return absolute tolerance
    */
  def get_absolute_tolerance(model: Model): String = model.solverSettings.absoluteTolerance

  /** Get relative tolerance setting.
    *
    * @param model data model
    * @return relative tolerance
    */
  def get_relative_tolerance(model: Model): String = model.solverSettings.relativeTolerance

  /** Get time tolerance.
    *
    * @param model data model
    * @return time tolerance
    */
  def get_tolerance_on_time(model: Model): String = model.solverSettings.toleranceOnTime

  /** Get max step size.
    *
    * @param model data model
    * @return max step size
    */
  def get_max_step_size(model: Model): String = model.solverSettings.maxStepSize

  /** Get solver.
    *
    * @param model data model
    * @return solver name
    */
  def get_solver(model: Model): String = model.solverSettings.solver
}
