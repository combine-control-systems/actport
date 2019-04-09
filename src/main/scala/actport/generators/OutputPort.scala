package actport.generators

import actport.Block
import actport.simulink._

object OutputPort extends Generator[Block] {
  override def apply(path: String)(implicit block: Block): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"
    Seq(
      AddBlock("simulink/Ports & Subsystems/Out1", blockPath)
    ) ++ commonProperties(path)
  }
}
