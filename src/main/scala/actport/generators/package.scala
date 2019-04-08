package actport

import actport.simulink._

package object generators {
  def dispatch(implicit block: ActivateBlock, path: String): Seq[String] = {
    block.blockType match {
      case "system/MathOperations/Sum" => generators.Sum(path)
      case "system/Ports/Input" => generators.InputPort(path)
      case "system/Ports/Output" => generators.OutputPort(path)
      case "system/SignalViewers/Scope" => generators.Scope(path)
      case _ => generators.Undefined(path)
    }
  }

  /** Apply common properties.
    *
    * @param path  block path
    * @param block Activate block
    * @return sequence of Matlab Simulink API calls.
    */
  def commonProperties(path: String)(implicit block: Block): Seq[String] = {
    val blockPath = s"$path/${block.name}"
    Seq(
      setParam(blockPath, "BackgroundColor", block.backgroundColor),
      setParam(blockPath, "ForegroundColor", block.foregroundColor),
      setParam(blockPath, "Position", block.rect),
      setParam(blockPath, "Orientation", if (block.flip) "left" else "right")
    )
  }
}
