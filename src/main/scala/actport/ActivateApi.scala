package actport

import java.awt.Color

import actport.simulink.{ArrangeSystem, NewSystem, OpenSystem, SimPath}
import monocle.macros.syntax.lens._

import scala.util.chaining._

object ActivateApi {
  /** Utility function to show type of input from Matlab call.
    *
    * @param a anything
    */
  def showType(a: Object): Unit = {
    println(a.getClass.getCanonicalName)
  }

  // -------------------- Diagrams

  /** Create a new diagram object.
    *
    * @return Subsystem object
    */
  def instantiate_diagram(): System = {
    System()
  }

  /** Set background color of diagram.
    *
    * @param subsystem the subsystem to change background color of
    * @return Diagram object
    */
  def set_diagram_bg_color(subsystem: System, color: Array[Double]): System = {
    require(color.length == 3, "Color must be specified as RGB with three elements.")
    require(color.foldLeft(false) { (s, v) => s || (v >= 0.0 && v <= 1.0) },
      "Color intensities must be specified as a value between 0.0 and 1.0.")
    subsystem.lens(_.backgroundColor).set(new Color(color(0).toFloat, color(1).toFloat, color(2).toFloat, 1.0f))
  }

  /** NOT SURE WHAT THIS IS
    *
    * Could this be z-order?
    *
    * @param subsystem subsystem object
    * @param value     0 = off, 1 = on ???
    * @return diagram object
    */
  def set_diagram_3d(subsystem: System, value: Int): System = {
    require(value == 0 || value == 1, "Value must be either 0 or 1.")
    subsystem.lens(_.diagram3d).set(value == 1)
  }

  /** Zoom level.
    *
    * @param subsystem subsystem object
    * @param zoom      zoom level > 0
    * @return diagram object
    */
  def set_diagram_zoom(subsystem: System, zoom: Double): System = {
    require(zoom > 0.0, "Value must be larger than 0.")
    subsystem.lens(_.zoom).set(zoom)
  }

  /** Set name of diagram.
    *
    * @param subsystem subsystem object
    * @param name      name of diagram
    * @return diagram object
    */
  def set_diagram_name(subsystem: System, name: String): System = {
    subsystem.lens(_.name).set(name)
  }

  /** Set diagram context.
    *
    * The context contains OML-code setting values related to the diagram.
    *
    * @param subsystem Subsystem object
    * @param context   context
    * @return diagram object
    */
  def set_diagram_context(subsystem: System, context: Array[String]): System = {
    subsystem.lens(_.context).set(context.toVector)
  }

  // -------------------- Blocks

  /** Instantiate block.
    *
    * @param blockType Activate block type string
    * @return block instance
    */
  def instantiate_block(blockType: String): Block = {
    Block(blockType = blockType)
  }

  /** Set block coordinate origin.
    *
    * @param block  block object
    * @param origin 2-element array of doubles representing a coordinate
    * @return block object
    */
  def set_block_origin(block: Entity, origin: Array[Double]): Entity = {
    require(origin.length == 2, "Origin array must contain exactly two elements.")
    val point = Point(origin(0).toInt, origin(1).toInt)
    block match {
      case b: Block => b.lens(_.origin).set(point)
      case b: System => b.lens(_.origin).set(point)
    }
  }

  /** Set size of block.
    *
    * @param block     block object
    * @param blockSize 2-element array of doubles representing width and height
    * @return block object
    */
  def set_block_size(block: Entity, blockSize: Array[Double]): Entity = {
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
      case b: Block => b.lens(_.size).set(size)
      case b: System => b.lens(_.size).set(size)
    }
  }

  /** Set block flip.
    *
    * @param block block object
    * @param flip  0 = no flip, 1 = flip
    * @return block object
    */
  def set_block_flip(block: Entity, flip: Int): Entity = {
    require(flip == 0 || flip == 1, "Flip must be either 0 or 1.")
    block match {
      case b: Block => b.lens(_.flip).set(flip == 1)
      case b: System => b.lens(_.flip).set(flip == 1)
    }
  }

  /** Set block theta rotation angle?
    *
    * @param block block object
    * @param theta rotation angle
    * @return block object
    */
  def set_block_theta(block: Entity, theta: Double): Entity = {
    block match {
      case b: Block => b.lens(_.theta).set(theta)
      case b: System => b.lens(_.theta).set(theta)
    }
  }

  /** Set block background color.
    *
    * @param block block object
    * @param color 4-element array of RGBA values between 0.0 and 1.0
    * @return block object
    */
  def set_block_bg_color(block: Entity, color: Array[Double]): Entity = {
    require(color.length == 4, "Color must be specified as RGBA with four elements.")
    require(color.foldLeft(false) { (s, v) => s || (v >= 0.0 && v <= 1.0) },
      "Color intensities must be specified as a value between 0.0 and 1.0.")
    val c = new Color(color(0).toFloat, color(1).toFloat, color(2).toFloat, color(3).toFloat)
    block match {
      case b: Block => b.lens(_.backgroundColor).set(c)
      case b: System => b.lens(_.backgroundColor).set(c)
    }
  }

  /** Set block foreground color.
    *
    * @param block block object
    * @param color 4-element array of RGBA values between 0.0 and 1.0
    * @return block object
    */
  def set_block_fg_color(block: Entity, color: Array[Double]): Entity = {
    require(color.length == 4, "Color must be specified as RGBA with four elements.")
    require(color.foldLeft(false) { (s, v) => s || (v >= 0.0 && v <= 1.0) },
      "Color intensities must be specified as a value between 0.0 and 1.0.")
    val c = new Color(color(0).toFloat, color(1).toFloat, color(2).toFloat, color(3).toFloat)
    block match {
      case b: Block => b.lens(_.foregroundColor).set(c)
      case b: System => b.lens(_.foregroundColor).set(c)
    }
  }

  /** Set number of input ports.
    *
    * @param block      block object
    * @param inputCount number of inputs
    * @return block object
    */
  def set_block_nin(block: Entity, inputCount: Int): Entity = {
    require(inputCount >= 0, "Input count must be positive.")
    block match {
      case b: Block => b.lens(_.inputCount).set(inputCount)
      case b: System => b.lens(_.inputCount).set(inputCount)
    }
  }

  /** Set number of output ports.
    *
    * @param block       block object
    * @param outputCount number of outputs
    * @return block object
    */
  def set_block_nout(block: Entity, outputCount: Int): Entity = {
    require(outputCount >= 0, "Output count must be positive.")
    block match {
      case b: Block => b.lens(_.outputCount).set(outputCount)
      case b: System => b.lens(_.outputCount).set(outputCount)
    }
  }

  /** Set number of event inputs.
    *
    * @param block           block object
    * @param eventInputCount number of event inputs
    * @return block object
    */
  def set_block_evtnin(block: Entity, eventInputCount: Int): Entity = {
    require(eventInputCount >= 0, "Event input count must be positive.")
    block match {
      case b: Block => b.lens(_.eventInputCount).set(eventInputCount)
      case b: System => b.lens(_.eventInputCount).set(eventInputCount)
    }
  }

  /** Set number of event outputs.
    *
    * @param block            block object
    * @param eventOutputCount number of event outputs
    * @return block object
    */
  def set_block_evtnout(block: Entity, eventOutputCount: Int): Entity = {
    require(eventOutputCount >= 0, "Event output count must be positive.")
    block match {
      case b: Block => b.lens(_.eventOutputCount).set(eventOutputCount)
      case b: System => b.lens(_.eventOutputCount).set(eventOutputCount)
    }
  }

  /** Set block parameters.
    *
    * @param block      block object
    * @param parameters block parameters
    * @return block object
    */
  def set_block_parameters_impl(block: Block, parameters: ActivateStruct): Block =
    block.lens(_.parameters).set(parameters)

  /** Set block identity.
    *
    * @param block    block object
    * @param identity identity of object
    * @return block object
    */
  def set_block_ident(block: Entity, identity: String): Entity =
    block match {
      case b: Block => b.lens(_.identity).set(identity)
      case b: System => b.lens(_.identity).set(identity)
    }

  /** Set block mask.
    *
    * @param block      block object
    * @param parameters block parameters
    * @param label      block label
    * @return block object
    */
  def set_block_mask_impl(block: Entity, parameters: ActivateStruct, label: String): Entity = {
    java.lang.System.err.println("set_block_mask_impl not implemented yet")
    block
  }

  // -------------------- Super Block

  /** Instantiate a new Activate super block.
    *
    * Don't do anything special here.
    *
    * @return empty super block
    */
  def instantiate_super_block(): Any = null

  /** Add diagram to super block.
    *
    * We are just returning the subsystem here.
    *
    * @param block     super block (usually null)
    * @param subsystem Subsystem to add
    * @return super block
    */
  def fill_super_block(block: Any, subsystem: System): System = subsystem

  /** Make super block atomic or not.
    *
    * @param block  super block
    * @param atomic 0 = not atomic, 1 = atomic
    * @return super block
    */
  def set_atomic_property(block: System, atomic: Int): System = {
    require(atomic == 0 || atomic == 1, "Atomic must be either 0 or 1.")
    block.lens(_.atomic).set(atomic == 1)
  }

  /** Set icon text of super block.
    *
    * @param block block object
    * @param text1 text 1 ???
    * @param text2 text 2 ???
    * @return block object
    */
  def set_block_icon_text(block: System, text1: String, text2: String): System = {
    block
  }

  // -------------------- Links

  /** Add an explicit link to diagram.
    *
    * @param system      diagram object
    * @param start       start port, array of [block, string with port number, "output"]
    * @param destination destination port, array of [block, string with port number, "input"]
    * @param points      array of points for routing of the link
    * @param unknownFlag NOT SURE WHAT THIS IS
    * @return diagram object
    */
  def add_explicit_link(system: System, start: Array[String],
                        destination: Array[String], points: Array[Array[Double]],
                        unknownFlag: Boolean): System = {
    require(start.length == 3, "start must contain (block tag, port number, \"output\"")
    require(start(2) == "output", "3rd element of start must be \"output\"")
    require(destination.length == 3, "destination must contain (block tag, port number, \"input\"")
    require(destination(2) == "input", "3rd element of start must be \"input\"")
    val optPoints = Option(points)
    val link = Link(start(0), start(1).toInt, destination(0), destination(1).toInt, ExplicitLink,
      optPoints match {
        case Some(p) => p.map { v => Point(v(0).toInt, v(1).toInt) }.toVector
        case _ => Vector.empty
      })
    system.lens(_.explicitLinks).modify(_ :+ link)
  }

  /** Add event link to diagram.
    *
    * @param system      diagram object.
    * @param start       start port, array of [block, string with event port number, "output"]
    * @param destination destination port, array of [block, string with event port number, "input"]
    * @param points      array of points for routing of the link
    * @param unknownFlag NOT SURE WHAT THIS IS
    * @return diagram object
    */
  def add_event_link(system: System, start: Array[String],
                     destination: Array[String], points: Array[Array[Double]],
                     unknownFlag: Boolean): System = {
    val optPoints = Option(points)
    val link = Link(start(0), start(1).toInt, destination(0), destination(1).toInt, EventLink,
      optPoints match {
        case Some(p) => p.map { v => Point(v(0).toInt, v(1).toInt) }.toVector
        case _ => Vector.empty
      })
    system.lens(_.eventLinks).modify(_ :+ link)
  }

  // -------------------- Model specific details

  /** Set workspace for model.
    *
    * @param system    diagram object
    * @param workspace workspace
    * @return diagram object
    */
  def set_model_workspace(system: System, workspace: Array[String]): System = {
    java.lang.System.err.println("set_model_workspace is not implemented yet")
    system
  }

  /** Set initial time of simulation.
    *
    * @param system      diagram object
    * @param initialTime initial time as a string
    * @return diagram object
    */
  def set_initial_time(system: System, initialTime: String): System = {
    java.lang.System.err.println("set_initial_time is not implemented yet")
    system
  }

  /** Set final time of simulation.
    *
    * @param system    diagram object
    * @param finalTime final time as a string
    * @return diagram object
    */
  def set_final_time(system: System, finalTime: String): System = {
    java.lang.System.err.println("set_final_time is not implemented yet")
    system
  }

  /** Set solver parameters.
    *
    * @param system     diagram object
    * @param parameters solver parameters
    * @return diagram
    */
  def set_solver_parameters(system: System, parameters: Array[String]): System = {
    java.lang.System.err.println("set_solver_parameters is not implemented yet")
    system
  }

  /** Evaluates the model and generates Matlab commands to generate Simulink model.
    *
    * @param system diagram object
    * @return serialized expressions
    */
  def evaluate_model(system: System): String = {
    // Apply transforms before exporting diagram.

    system
      // Transforms are added here in the order they are supposed to be applied.
      .pipe(transforms.Split.eliminateSplitBlocks)
      .pipe(transforms.EventPortIndex.updatePortIndices)
      // Serialize model to Matlab commands.
      .pipe { s =>
        val systemName = if (s.name.isEmpty) "New Model" else s.name

        val prelude = Seq(
          NewSystem(systemName), // Create a new system as a first thing.
          OpenSystem(systemName) // Open it immediately.
        )

        // Convert the content of the root system into expressions.
        val rootSystem = s.toExpression(SimPath(""))

        // Add an expression to arrange the root system.
        val arrangeSystem = Seq(ArrangeSystem(SimPath(systemName)))

        (prelude ++ rootSystem ++ arrangeSystem)
          .map(_.serialize) // serialize the expressions
          .tap(_.foreach(println)) // print serialized expressions to the terminal
          .mkString("\n") // join expressions with a new line.
      }
  }
}
