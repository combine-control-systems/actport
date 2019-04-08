package actport

import java.awt.Color

import scala.util.chaining._

object ActivateApi {
  def test(a: Object): Unit = {
    println(a.getClass.getCanonicalName)
  }

  // -------------------- Diagrams

  /** Create a new diagram object.
    *
    * @return Diagram object
    */
  def instantiate_diagram(): Diagram = {
    Diagram(name = None, path = None)
  }

  /** Set background color of diagram.
    *
    * @param diagram the diagram to change background color of
    * @return Diagram object
    */
  def set_diagram_bg_color(diagram: Diagram, color: Array[Double]): Diagram = {
    require(color.length == 3, "Color must be specified as RGB with three elements.")
    require(color.foldLeft(false) { (s, v) => s || (v >= 0.0 && v <= 1.0) },
      "Color intensities must be specified as a value between 0.0 and 1.0.")
    diagram.copy(backgroundColor = new Color(
      color(0).toFloat, color(1).toFloat, color(2).toFloat, 1.0f))
  }

  /** NOT SURE WHAT THIS IS
    *
    * @param diagram diagram object
    * @param value 0 = off, 1 = on
    * @return diagram object
    */
  def set_diagram_3d(diagram: Diagram, value: Int): Diagram = {
    require(value == 0 || value == 1, "Value must be either 0 or 1.")
    diagram.copy(diagram3d = value == 1)
  }

  /** Zoom level.
    *
    * @param diagram diagram object
    * @param zoom zoom level > 0
    * @return diagram object
    */
  def set_diagram_zoom(diagram: Diagram, zoom: Double): Diagram = {
    require(zoom > 0.0, "Value must be larger than 0.0.")
    diagram.copy(zoom = zoom)
  }

  /** Set name of diagram.
    *
    * @param diagram diagram object
    * @param name name of diagram
    * @return diagram object
    */
  def set_diagram_name(diagram: Diagram, name: String): Diagram = {
    diagram.copy(name = Some(name))
  }

  /** Set diagram context.
    *
    * The context contains OML-code setting values related to the diagram.
    *
    * @param diagram diagram object
    * @param context context
    * @return diagram object
    */
  def set_diagram_context(diagram: Diagram, context: Array[String]): Diagram = {
    diagram.copy(context = context.toVector)
  }

  // -------------------- Blocks

  /** Instantiate block.
    *
    * @param blockType Activate block type string
    * @return block instance
    */
  def instantiate_block(blockType: String): ActivateBlock = {
    ActivateBlock(blockType = blockType)
  }

  /** Set block coordinate origin.
    *
    * @param block block object
    * @param origin 2-element array of doubles representing a coordinate
    * @return block object
    */
  def set_block_origin(block: Block, origin: Array[Double]): Block = {
    require(origin.length == 2, "Origin array must contain exactly two elements.")
    val point = Point(origin(0).toInt, origin(1).toInt)
    block match {
      case b: ActivateBlock => b.copy(origin = point)
      case b: ActivateSuperBlock => b.copy(origin = point)
    }
  }

  /** Set size of block.
    *
    * @param block block object
    * @param blockSize 2-element array of doubles representing width and height
    * @return block object
    */
  def set_block_size(block: Block, blockSize: Array[Double]): Block = {
    require(blockSize.length == 2, "Size array must contain exactly two elements.")
    require(blockSize.foldLeft(false) { (s, v) => s || v >= 0.0 }, "Size cannot be negative.")

    val width = {
      val w = blockSize(0).toInt
      if (w <= Configuration.minimumWidth) Configuration.minimumWidth else w
    }

    val height = {
      val h = blockSize(1).toInt
      if (h <= Configuration.minimumHeight) Configuration.minimumHeight else h
    }

    val size = Size(width, height)
    block match {
      case b: ActivateBlock => b.copy(size = size)
      case b: ActivateSuperBlock => b.copy(size = size)
    }
  }

  /** Set block flip.
    *
    * @param block block object
    * @param flip 0 = no flip, 1 = flip
    * @return block object
    */
  def set_block_flip(block: Block, flip: Int): Block = {
    require(flip == 0 || flip == 1, "Flip must be either 0 or 1.")
    block match {
      case b: ActivateBlock => b.copy(flip = flip == 1)
      case b: ActivateSuperBlock => b.copy(flip = flip == 1)
    }
  }

  /** Set block theta rotation angle?
    *
    * @param block block object
    * @param theta rotation angle
    * @return block object
    */
  def set_block_theta(block: Block, theta: Double): Block = {
    block match {
      case b: ActivateBlock => b.copy(theta = theta)
      case b: ActivateSuperBlock => b.copy(theta = theta)
    }
  }

  /** Set block background color.
    *
    * @param block block object
    * @param color 4-element array of RGBA values between 0.0 and 1.0
    * @return block object
    */
  def set_block_bg_color(block: Block, color: Array[Double]): Block = {
    require(color.length == 4, "Color must be specified as RGBA with four elements.")
    require(color.foldLeft(false) { (s, v) => s || (v >= 0.0 && v <= 1.0) },
      "Color intensities must be specified as a value between 0.0 and 1.0.")
    val c = new Color(color(0).toFloat, color(1).toFloat, color(2).toFloat, color(3).toFloat)
    block match {
      case b: ActivateBlock => b.copy(backgroundColor = c)
      case b: ActivateSuperBlock => b.copy(backgroundColor = c)
    }
  }

  /** Set block foreground color.
    *
    * @param block block object
    * @param color 4-element array of RGBA values between 0.0 and 1.0
    * @return block object
    */
  def set_block_fg_color(block: Block, color: Array[Double]): Block = {
    require(color.length == 4, "Color must be specified as RGBA with four elements.")
    require(color.foldLeft(false) { (s, v) => s || (v >= 0.0 && v <= 1.0) },
      "Color intensities must be specified as a value between 0.0 and 1.0.")
    val c = new Color(color(0).toFloat, color(1).toFloat, color(2).toFloat, color(3).toFloat)
    block match {
      case b: ActivateBlock => b.copy(foregroundColor = c)
      case b: ActivateSuperBlock => b.copy(foregroundColor = c)
    }
  }

  /** Set number of input ports.
    *
    * @param block block object
    * @param inputCount number of inputs
    * @return block object
    */
  def set_block_nin(block: Block, inputCount: Int): Block = {
    require(inputCount >= 0, "Input count must be positive.")
    block match {
      case b: ActivateBlock => b.copy(inputCount = inputCount)
      case b: ActivateSuperBlock => b.copy(inputCount = inputCount)
    }
  }

  /** Set number of output ports.
    *
    * @param block block object
    * @param outputCount number of outputs
    * @return block object
    */
  def set_block_nout(block: Block, outputCount: Int): Block = {
    require(outputCount >= 0, "Output count must be positive.")
    block match {
      case b: ActivateBlock => b.copy(outputCount = outputCount)
      case b: ActivateSuperBlock => b.copy(outputCount = outputCount)
    }
  }

  /** Set number of event inputs.
    *
    * @param block block object
    * @param eventInputCount number of event inputs
    * @return block object
    */
  def set_block_evtnin(block: Block, eventInputCount: Int): Block = {
    require(eventInputCount >= 0, "Event input count must be positive.")
    block match {
      case b: ActivateBlock => b.copy(eventInputCount = eventInputCount)
      case b: ActivateSuperBlock => b.copy(eventInputCount = eventInputCount)
    }
  }

  /** Set number of event outputs.
    *
    * @param block block object
    * @param eventOutputCount number of event outputs
    * @return block object
    */
  def set_block_evtnout(block: Block, eventOutputCount: Int): Block = {
    require(eventOutputCount >= 0, "Event output count must be positive.")
    block match {
      case b: ActivateBlock => b.copy(eventOutputCount = eventOutputCount)
      case b: ActivateSuperBlock => b.copy(eventOutputCount = eventOutputCount)
    }
  }

  /** Set block parameters.
    *
    * @param block block object
    * @param parameters block parameters
    * @return block object
    */
  def set_block_parameters_impl(block: ActivateBlock, parameters: ActivateStruct): ActivateBlock = {
    block.copy(parameters = parameters)
  }

  /** Add block to diagram.
    *
    * @param diagram diagram object
    * @param block block object
    * @param blockName name to assign block (must be unique within the diagram)
    * @return diagram object
    */
  def add_block_impl(diagram: Diagram, block: Block, blockName: String): Array[Object] = {
    val blockWithName = block match {
      case b: ActivateBlock => b.copy(name = blockName)
      case b: ActivateSuperBlock => b.copy(name = blockName)
    }
    Array(diagram.copy(children = diagram.children :+ blockWithName), blockWithName.name)
  }

  def set_block_ident(block: Block, identity: String): Block = {
    block match {
      case b: ActivateBlock => b.copy(identity = identity)
      case b: ActivateSuperBlock => b.copy(identity = identity)
    }
  }

  def set_block_mask_impl(block: Block, parameters: ActivateStruct, label: String): Block = {
    System.err.println("set_block_mask_impl not implemented yet")
    block
  }

  // -------------------- Super Block

  /** Instantiate a new Activate super block.
    *
    * @return empty super block
    */
  def instantiate_super_block(): ActivateSuperBlock = {
    ActivateSuperBlock()
  }

  /** Add diagram to super block.
    *
    * @param block super block
    * @param diagram diagram to add
    * @return super block
    */
  def fill_super_block(block: ActivateSuperBlock, diagram: Diagram): ActivateSuperBlock = {
    block.copy(diagram = Some(diagram))
  }

  /** Make super block atomic or not.
    *
    * @param block super block
    * @param atomic 0 = not atomic, 1 = atomic
    * @return super block
    */
  def set_atomic_property(block: ActivateSuperBlock, atomic: Int): ActivateSuperBlock = {
    require(atomic == 0 || atomic == 1, "Atomic must be either 0 or 1.")
    block.copy(atomic = atomic == 1)
  }

  def set_block_icon_text(block: ActivateSuperBlock, text1: String, text2: String): ActivateSuperBlock = {
    block
  }

  // -------------------- Links

  /** Add an explicit link to diagram.
    *
    * @param diagram diagram object
    * @param start start port, array of [block, string with port number, "output"]
    * @param destination destination port, array of [block, string with port number, "input"]
    * @param points array of points for routing of the link
    * @param unknownFlag NOT SURE WHAT THIS IS
    * @return diagram object
    */
  def add_explicit_link(diagram: Diagram, start: Array[String],
                        destination: Array[String], points: Array[Array[Double]],
                        unknownFlag: Boolean): Diagram = {
    require(start.length == 3, "start must contain (block tag, port number, \"output\"")
    require(start(2) == "output", "3rd element of start must be \"output\"")
    require(destination.length == 3, "destination must contain (block tag, port number, \"input\"")
    require(destination(2) == "input", "3rd element of start must be \"input\"")
    val optPoints = Option(points)
    val link = Link(start(0), start(1).toInt, destination(0), destination(1).toInt,
      optPoints match {
        case Some(p) => p.map { v => Point(v(0).toInt, v(1).toInt) }.toVector
        case _ => Vector.empty
      })
    diagram.copy(explicitLinks = diagram.explicitLinks :+ link)
  }

  /** Add event link to diagram.
    *
    * @param diagram diagram object.
    * @param start start port, array of [block, string with event port number, "output"]
    * @param destination destination port, array of [block, string with event port number, "input"]
    * @param points array of points for routing of the link
    * @param unknownFlag NOT SURE WHAT THIS IS
    * @return diagram object
    */
  def add_event_link(diagram: Diagram, start: Array[String],
                     destination: Array[String], points: Array[Array[Double]],
                     unknownFlag: Boolean): Diagram = {
    val optPoints = Option(points)
    val link = Link(start(0), start(1).toInt, destination(0), destination(1).toInt,
      optPoints match {
        case Some(p) => p.map { v => Point(v(0).toInt, v(1).toInt) }.toVector
        case _ => Vector.empty
      })
    diagram.copy(eventLinks = diagram.eventLinks :+ link)
  }

  // -------------------- Model specific details

  /** Set workspace for model.
    *
    * @param diagram diagram object
    * @param workspace workspace
    * @return diagram object
    */
  def set_model_workspace(diagram: Diagram, workspace: Array[String]): Diagram = {
    System.err.println("set_model_workspace is not implemented yet")
    diagram
  }

  /** Set initial time of simulation.
    *
    * @param diagram diagram object
    * @param initialTime initial time as a string
    * @return diagram object
    */
  def set_initial_time(diagram: Diagram, initialTime: String): Diagram = {
    System.err.println("set_initial_time is not implemented yet")
    diagram
  }

  /** Set final time of simulation.
    *
    * @param diagram diagram object
    * @param finalTime final time as a string
    * @return diagram object
    */
  def set_final_time(diagram: Diagram, finalTime: String): Diagram = {
    System.err.println("set_final_time is not implemented yet")
    diagram
  }

  def set_solver_parameters(diagram: Diagram, parameters: Array[String]): Diagram = {
    System.err.println("set_solver_parameters is not implemented yet")
    diagram
  }

  /** Evaluates the model and generates Matlab commands to generate Simulink model.
    *
    * @param diagram
    * @return
    */
  def evaluate_model(diagram: Diagram): String = {
    import simulink._

    // Apply transforms before exporting diagram.
    transforms.Split.eliminateSplitBlocks(diagram).pipe { d =>
      val diagramName = d.name.getOrElse("New Model")
      (Seq(
        newSystem(diagramName),
        openSystem(diagramName)
      ) ++ d.toMatlab(diagramName)).mkString("\n")
    }
  }
}
