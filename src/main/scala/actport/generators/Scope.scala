package actport.generators

import actport.Block
import actport.simulink._

object Scope extends Generator[Block] {
  override def apply(path: String)(implicit block: Block): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"
    Seq(
      AddBlock(Simulink.Sinks.Scope, blockPath),
      SetParam(blockPath, "NumInputPorts", block.inputCount)
    ) ++ commonProperties(path)
  }
}
