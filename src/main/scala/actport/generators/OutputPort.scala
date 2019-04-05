package actport.generators

import actport.Block
import actport.simulink._

object OutputPort extends Generator[Block] {
  override def apply(path: String)(implicit block: Block): Seq[String] = {
    val blockPath = s"$path/${block.name}"
    Seq(
      addBlock("simulink/Ports & Subsystems/Out1", blockPath),
      setParam(blockPath, "position", block.rect)
    )
  }
}
