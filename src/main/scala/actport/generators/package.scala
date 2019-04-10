package actport

import actport.simulink._

package object generators {
  /** Dispatch block to generate expressions.
    *
    * @param path  path in diagram
    * @param block Activate block identifier
    * @return sequence of expressions to create the block in Simulink
    */
  def dispatch(path: String)(implicit block: ActivateBlock): Seq[Expression] = {
    block.blockType match {
      case "system/ActivationOperations/SampleClock" => generators.SampleClock(path)
      case "system/MathOperations/Sum" => generators.Sum(path)
      case "system/MatrixOperations/MatrixGain" => generators.MatrixGain(path)
      case "system/Ports/Input" => generators.InputPort(path)
      case "system/Ports/Output" => generators.OutputPort(path)
      case "system/Routing/Demux" => generators.Demux(path)
      case "system/Routing/Mux" => generators.Mux(path)
      case "system/SignalGenerators/Random" => generators.Random(path)
      case "system/SignalViewers/Scope" => generators.Scope(path)
      case _ => generators.Undefined(path)
    }
  }

  /** Apply common properties.
    *
    * @param path  block path
    * @param block Activate block
    * @return sequence of expressions
    */
  def commonProperties(path: String)(implicit block: Block): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"
    Seq(
      SetParam(blockPath, "BackgroundColor", block.backgroundColor),
      SetParam(blockPath, "ForegroundColor", block.foregroundColor),
      SetParam(blockPath, "Position", block.rect),
      SetParam(blockPath, "Orientation", if (block.flip) "left" else "right")
    )
  }
}
