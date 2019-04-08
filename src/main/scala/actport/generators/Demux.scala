package actport.generators

import actport.ActivateBlock
import actport.simulink._

object Demux extends Generator[ActivateBlock] {
  override def apply(path: String)(implicit block: ActivateBlock): Seq[String] = {
    val blockPath = s"$path/${block.name}"

    Seq(
      addBlock("simulink/Signal Routing/Demux", blockPath),
      setParam(blockPath, "Outputs", block.outputCount)
    ) ++ commonProperties(path)
  }
}
