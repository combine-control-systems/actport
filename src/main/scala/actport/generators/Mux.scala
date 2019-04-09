package actport.generators

import actport.ActivateBlock
import actport.simulink._

object Mux extends Generator[ActivateBlock] {
  override def apply(path: String)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"

    Seq(
      AddBlock("simulink/Signal Routing/Mux", blockPath),
      SetParam(blockPath, "Inputs", block.inputCount)
    ) ++ commonProperties(path)
  }
}
