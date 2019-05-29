package actport.oml

import java.awt.Color

import actport.{Configuration, Logger, oml}
import monocle.macros.syntax.lens._

import scala.util.chaining._

object Matlab {
  /** Utility function to show type of input from Matlab call.
    *
    * @param a anything
    */
  def showType(a: Object): Unit = println(a.getClass.getCanonicalName)

  // -------------------- Diagrams

  /** Create a new diagram object.
    *
    * @return Subsystem object
    */
  def instantiate_diagram(): ParsedSystem = ParsedSystem()

  /** Set background color of diagram.
    *
    * @param subsystem the subsystem to change background color of
    * @return Diagram object
    */
  def set_diagram_bg_color(subsystem: ParsedSystem, color: Array[Double]): ParsedSystem = {
    require(color.length == 3, "Color must be specified as RGB with three elements.")
    require(color.foldLeft(false) { (s, v) => s || (v >= 0.0 && v <= 1.0) },
      "Color intensities must be specified as a value between 0.0 and 1.0.")
    subsystem.lens(_.backgroundColor).set(new Color(color(0).toFloat, color(1).toFloat, color(2).toFloat, 1.0f))
  }

  /** Not used.
    *
    * @param subsystem subsystem object
    * @param value     don't matter
    * @return diagram object
    */
  def set_diagram_3d(subsystem: ParsedSystem, value: Int): ParsedSystem = subsystem

  /** Zoom level.
    *
    * @param subsystem subsystem object
    * @param zoom      zoom level > 0
    * @return diagram object
    */
  def set_diagram_zoom(subsystem: ParsedSystem, zoom: Double): ParsedSystem = {
    require(zoom > 0.0, "Value must be larger than 0.")
    subsystem.lens(_.zoom).set(zoom)
  }

  /** Set name of diagram.
    *
    * @param subsystem subsystem object
    * @param name      name of diagram
    * @return diagram object
    */
  def set_diagram_name(subsystem: ParsedSystem, name: String): ParsedSystem =
    subsystem.lens(_.name).set(name)

  /** Set diagram context.
    *
    * The context contains OML-code setting values related to the diagram.
    *
    * @param subsystem Subsystem object
    * @param context   context
    * @return diagram object
    */
  def set_diagram_context(subsystem: ParsedSystem, context: Array[String]): ParsedSystem =
    subsystem.lens(_.context).set(Some(context.mkString))

  // -------------------- Blocks

  /** Instantiate block.
    *
    * @param blockType Activate block type string
    * @return block instance
    */
  def instantiate_block(blockType: String): ParsedBlock =
    oml.ParsedBlock(blockType = blockType)

  /** Set block coordinate origin.
    *
    * @param block  block object
    * @param origin 2-element array of doubles representing a coordinate
    * @return block object
    */
  def set_block_origin(block: ParsedEntity, origin: Array[Double]): ParsedEntity = {
    require(origin.length == 2, "Origin array must contain exactly two elements.")
    val point = Point(origin(0).toInt, origin(1).toInt)
    block match {
      case b: ParsedBlock => b.lens(_.origin).set(point)
      case b: ParsedSystem => b.lens(_.origin).set(point)
    }
  }

  /** Set size of block.
    *
    * @param block     block object
    * @param blockSize 2-element array of doubles representing width and height
    * @return block object
    */
  def set_block_size(block: ParsedEntity, blockSize: Array[Double]): ParsedEntity = {
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
      case b: ParsedBlock => b.lens(_.size).set(size)
      case b: ParsedSystem => b.lens(_.size).set(size)
    }
  }

  /** Set block flip.
    *
    * @param block block object
    * @param flip  0 = no flip, 1 = flip
    * @return block object
    */
  def set_block_flip(block: ParsedEntity, flip: Int): ParsedEntity = {
    require(flip == 0 || flip == 1, "Flip must be either 0 or 1.")
    block match {
      case b: ParsedBlock => b.lens(_.flip).set(flip == 1)
      case b: ParsedSystem => b.lens(_.flip).set(flip == 1)
    }
  }

  /** Set block theta rotation angle?
    *
    * The angle is given as a multiple of 90 degrees.
    *
    * @param block block object
    * @param theta rotation angle
    * @return block object
    */
  def set_block_theta(block: ParsedEntity, theta: Double): ParsedEntity =
    block match {
      case b: ParsedBlock => b.lens(_.theta).set(theta)
      case b: ParsedSystem => b.lens(_.theta).set(theta)
    }

  /** Set block background color.
    *
    * @param block block object
    * @param color 4-element array of RGBA values between 0.0 and 1.0
    * @return block object
    */
  def set_block_bg_color(block: ParsedEntity, color: Array[Double]): ParsedEntity = {
    require(color.length == 4, "Color must be specified as RGBA with four elements.")
    require(color.foldLeft(false) { (s, v) => s || (v >= 0.0 && v <= 1.0) },
      "Color intensities must be specified as a value between 0.0 and 1.0.")
    val c = new Color(color(0).toFloat, color(1).toFloat, color(2).toFloat, color(3).toFloat)
    block match {
      case b: ParsedBlock => b.lens(_.backgroundColor).set(c)
      case b: ParsedSystem => b.lens(_.backgroundColor).set(c)
    }
  }

  /** Set block foreground color.
    *
    * @param block block object
    * @param color 4-element array of RGBA values between 0.0 and 1.0
    * @return block object
    */
  def set_block_fg_color(block: ParsedEntity, color: Array[Double]): ParsedEntity = {
    require(color.length == 4, "Color must be specified as RGBA with four elements.")
    require(color.foldLeft(false) { (s, v) => s || (v >= 0.0 && v <= 1.0) },
      "Color intensities must be specified as a value between 0.0 and 1.0.")
    val c = new Color(color(0).toFloat, color(1).toFloat, color(2).toFloat, color(3).toFloat)
    block match {
      case b: ParsedBlock => b.lens(_.foregroundColor).set(c)
      case b: ParsedSystem => b.lens(_.foregroundColor).set(c)
    }
  }

  /** Set number of input ports.
    *
    * @param block      block object
    * @param inputCount number of inputs
    * @return block object
    */
  def set_block_nin(block: ParsedEntity, inputCount: Int): ParsedEntity = {
    require(inputCount >= 0, "Input count must be positive.")
    block match {
      case b: ParsedBlock => b.lens(_.inputCount).set(inputCount)
      case b: ParsedSystem => b.lens(_.inputCount).set(inputCount)
    }
  }

  /** Set number of output ports.
    *
    * @param block       block object
    * @param outputCount number of outputs
    * @return block object
    */
  def set_block_nout(block: ParsedEntity, outputCount: Int): ParsedEntity = {
    require(outputCount >= 0, "Output count must be positive.")
    block match {
      case b: ParsedBlock => b.lens(_.outputCount).set(outputCount)
      case b: ParsedSystem => b.lens(_.outputCount).set(outputCount)
    }
  }

  /** Set number of event inputs.
    *
    * @param block           block object
    * @param eventInputCount number of event inputs
    * @return block object
    */
  def set_block_evtnin(block: ParsedEntity, eventInputCount: Int): ParsedEntity = {
    require(eventInputCount >= 0, "Event input count must be positive.")
    block match {
      case b: ParsedBlock => b.lens(_.eventInputCount).set(eventInputCount)
      case b: ParsedSystem => b.lens(_.eventInputCount).set(eventInputCount)
    }
  }

  /** Set number of event outputs.
    *
    * @param block            block object
    * @param eventOutputCount number of event outputs
    * @return block object
    */
  def set_block_evtnout(block: ParsedEntity, eventOutputCount: Int): ParsedEntity = {
    require(eventOutputCount >= 0, "Event output count must be positive.")
    block match {
      case b: ParsedBlock => b.lens(_.eventOutputCount).set(eventOutputCount)
      case b: ParsedSystem => b.lens(_.eventOutputCount).set(eventOutputCount)
    }
  }

  /** Set block parameters.
    *
    * @param block      block object
    * @param parameters block parameters
    * @return block object
    */
  def set_block_parameters_impl(block: ParsedBlock, parameters: ActivateStruct): ParsedBlock =
    block.lens(_.parameters).set(parameters)

  /** Add block to diagram.
    *
    * @param system    diagram object
    * @param block     block object
    * @param blockName name to assign block (must be unique within the diagram)
    * @return diagram object
    */
  def add_block_impl(system: ParsedSystem, block: ParsedEntity, blockName: String): ParsedSystem =
    (block match {
      case b: ParsedBlock => b.lens(_.name).set(blockName)
      case b: ParsedSystem => b.lens(_.name).set(blockName)
    }).pipe(b => system.lens(_.children).modify(_ :+ b))

  /** Set block identity.
    *
    * @param block    block object
    * @param identity identity of object
    * @return block object
    */
  def set_block_ident(block: ParsedEntity, identity: String): ParsedEntity =
    block match {
      case b: ParsedBlock => b.lens(_.identity).set(identity)
      case b: ParsedSystem => b.lens(_.identity).set(identity)
    }

  /** Set block mask.
    *
    * @param block      block object
    * @param parameters block parameters
    * @param label      block label
    * @return block object
    */
  def set_block_mask_impl(block: ParsedEntity, parameters: ActivateStruct, label: String): ParsedEntity =
    block match {
      case b: ParsedBlock => b.lens(_.mask).set(Some(parameters))
      case b: ParsedSystem => b.lens(_.mask).set(Some(parameters))
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
  def fill_super_block(block: Any, subsystem: ParsedSystem): ParsedSystem = subsystem

  /** Make super block atomic or not.
    *
    * @param block  super block
    * @param atomic 0 = not atomic, 1 = atomic
    * @return super block
    */
  def set_atomic_property(block: ParsedSystem, atomic: Int): ParsedSystem = {
    require(atomic == 0 || atomic == 1, "Atomic must be either 0 or 1.")
    block.lens(_.atomic).set(atomic == 1)
  }

  /** Set icon text of super block.
    *
    * @param block block object
    * @param text1 identification of the icon text (the name)
    * @param text2 the value
    * @return block object
    */
  def set_block_icon_text(block: ParsedSystem, text1: String, text2: String): ParsedSystem = block // Do nothing.

  // -------------------- Links

  /** Add an explicit link to diagram.
    *
    * @param system      diagram object
    * @param first       input or output port, array of [block, string with port number, "output" | "input"]
    * @param second      input or output port, array of [block, string with port number, "output" | "input"]
    * @param points      array of points for routing of the link
    * @param coordType   if true the intermediate coordinate points are relative, if false they are absolute
    * @return diagram object
    */
  def add_explicit_link(system: ParsedSystem, first: Array[String],
                        second: Array[String], points: Array[Array[Double]],
                        coordType: Boolean): ParsedSystem = {
    require(first.length == 3, "first must contain (block tag, port number, direction (input/output)")
    require(second.length == 3, "second must contain (block tag, port number, direction (input/output)")
    // Find out which port is the start port and which is the destination port.
    val (start, destination) = (first(2), second(2)) match {
      case ("input", "output") => (second, first)
      case ("output", "input") => (first, second)
      case _ => throw new IllegalStateException("Only one output and input port are supported")
    }
    // require(start(2) == "output", "3rd element of start must be \"output\"")
    // require(destination(2) == "input", "3rd element of destination must be \"input\"")
    val optPoints = Option(points)
    val link = Link(start(0), start(1).toInt, destination(0), destination(1).toInt, ExplicitLink,
      // Process points, if necessary.
      // TODO: Handle coordType properly here.
      optPoints match {
        case Some(p) => p.map { v => Point(v(0).toInt, v(1).toInt) }.toVector
        case _ => Vector.empty
      })
    // Add the link to the explicit links.
    system.lens(_.explicitLinks).modify(_ :+ link)
  }

  /** Add event link to diagram.
    *
    * @param system      diagram object.
    * @param first       input or output port, array of [block, string with event port number, "output" | "input"]
    * @param second      input or output port, array of [block, string with event port number, "output" | "input"]
    * @param points      array of points for routing of the link
    * @param coordType   if true the intermediate coordinate points are relative, if false they are absolute
    * @return diagram object
    */
  def add_event_link(system: ParsedSystem, first: Array[String],
                     second: Array[String], points: Array[Array[Double]],
                     coordType: Boolean): ParsedSystem = {
    require(first.length == 3, "first must contain (block tag, port number, direction (input/output)")
    require(second.length == 3, "second must contain (block tag, port number, direction (input/output)")
    // Find out which port is the start port and which is the destination port.
    val (start, destination) = (first(2), second(2)) match {
      case ("input", "output") => (second, first)
      case ("output", "input") => (first, second)
      case _ => throw new IllegalStateException("Only one output and input port are supported")
    }
    // The points could possibly be null. Option(null) -> None
    val optPoints = Option(points)
    val link = oml.Link(start(0), start(1).toInt, destination(0), destination(1).toInt, EventLink,
      // Process points, if necessary.
      // TODO: Handle coordType properly here.
      optPoints match {
        case Some(p) => p.map { v => Point(v(0).toInt, v(1).toInt) }.toVector
        case _ => Vector.empty
      })
    // Add the link to the event links.
    system.lens(_.eventLinks).modify(_ :+ link)
  }

  /** Add implicit link to diagram.
    *
    * @param system      diagram object.
    * @param first       input or output port, array of [block, string with event port number, "output" | "input"]
    * @param second      input or output port, array of [block, string with event port number, "output" | "input"]
    * @param points      array of points for routing of the link
    * @param coordType   if true the intermediate coordinate points are relative, if false they are absolute
    * @return diagram object
    */
  def add_implicit_link(system: ParsedSystem, first: Array[String],
                        second: Array[String], points: Array[Array[Double]],
                        coordType: Boolean): ParsedSystem = {
    Logger.log(s"ignoring implicit link (${first.mkString(", ")} to ${second.mkString(", ")})")
    system
//    require(first.length == 3, "first must contain (block tag, port number, direction (input/ouptut)")
//    require(second.length == 3, "second must contain (block tag, port number, direction (input/ouptut)")
//    // Find out which port is the start port and which is the destination port.
//    val (start, destination) = (first(2), second(2)) match {
//      case ("input", "output") => (second, first)
//      case ("output", "input") => (first, second)
//      case _ => throw new IllegalStateException("Only one output and input port are supported")
//    }
//    // The points could possibly be null. Option(null) -> None
//    val optPoints = Option(points)
//    val link = oml.Link(start(0), start(1).toInt, destination(0), destination(1).toInt, ImplicitLink,
//      // Process points, if necessary.
//      // TODO: Handle coordType properly here.
//      optPoints match {
//        case Some(p) => p.map { v => Point(v(0).toInt, v(1).toInt) }.toVector
//        case _ => Vector.empty
//      })
//    // Add the link to the implicit links.
//    system.lens(_.implicitLinks).modify(_ :+ link)
  }

  // -------------------- Model specific details

  /** Set workspace for model.
    *
    * @param system    diagram object
    * @param workspace workspace
    * @return diagram object
    */
  def set_model_workspace(system: ParsedSystem, workspace: Array[String]): ParsedSystem =
    system.lens(_.context).modify(_.map(ctx => s"${workspace.mkString}\n$ctx"))

  /** Set initial time of simulation.
    *
    * @param system      diagram object
    * @param initialTime initial time as a string
    * @return diagram object
    */
  def set_initial_time(system: ParsedSystem, initialTime: String): ParsedSystem =
    system.lens(_.solverSettings.initialTime).set(initialTime)

  /** Set final time of simulation.
    *
    * @param system    diagram object
    * @param finalTime final time as a string
    * @return diagram object
    */
  def set_final_time(system: ParsedSystem, finalTime: String): ParsedSystem =
    system.lens(_.solverSettings.finalTime).set(finalTime)

  /** Set solver parameters.
    *
    * In the OML-file the parameters are represented by something like:
    *
    * ```
    * tol = {'0.000001', '0.000001', '-1', '0' , '0', 'lsodar', '-1'};
    *            ^            ^        ^    ^     ^       ^       ^
    *            |            |        |    |     |       |       |
    *            |            |        |    |     |       |       \-- Max Step Size        (0)
    *            |            |        |    |     |       \---------- Solver               (1)
    *            |            |        |    |     \------------------ Realtime Scaling     (2)
    *            |            |        |    \------------------------ Initial Time         (3)
    *            |            |        \----------------------------- Tolerance on Time    (4)
    *            |            \-------------------------------------- Relative Tolerance   (5)
    *            \--------------------------------------------------- Absolute Tolerance   (6)
    * ```
    *
    * @param system     diagram object
    * @param parameters solver parameters
    * @return diagram
    */
  def set_solver_parameters(system: ParsedSystem, parameters: Array[String]): ParsedSystem =
    system.lens(_.solverSettings).modify(_.copy(
      absoluteTolerance = parameters(0),
      relativeTolerance = parameters(1),
      toleranceOnTime = parameters(2),
      realtimeScaling = parameters(4),
      solver = parameters(5),
      maxStepSize = parameters(6)
    ))
}
