package actport.generators

import actport.ActivateBlock
import actport.simulink._

object Demux extends Generator[ActivateBlock] {
  override def apply(path: String)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"

    Seq(
      AddBlock("simulink/Signal Routing/Demux", blockPath),
      SetParam(blockPath, "Outputs", block.outputCount)
    ) ++ commonProperties(path)
  }
}
