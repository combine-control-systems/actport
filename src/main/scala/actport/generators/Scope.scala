package actport.generators

import actport.Block
import actport.simulink._

object Scope extends Generator[Block] {
  override def apply(path: String)(implicit block: Block): Seq[String] = {
    val blockPath = s"$path/${block.name}"
    Seq(
      addBlock("simulink/Sinks/Scope", blockPath),
      setParam(blockPath, "position", block.rect),
      setParam(blockPath, "NumInputPorts", block.inputCount)
    )
  }
}
