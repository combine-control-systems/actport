package actport.generators

import actport.ActivateBlock
import actport.simulink._

object Mux extends Generator[ActivateBlock] {
  override def apply(path: String)(implicit block: ActivateBlock): Seq[String] = {
    val blockPath = s"$path/${block.name}"

    Seq(
      addBlock("simulink/Signal Routing/Mux", blockPath),
      setParam(blockPath, "Inputs", block.inputCount)
    ) ++ commonProperties(path)
  }
}
