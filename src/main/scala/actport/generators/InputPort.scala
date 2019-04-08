package actport.generators

import actport.Block
import actport.simulink._

object InputPort extends Generator[Block] {
  override def apply(path: String)(implicit block: Block): Seq[String] = {
    val blockPath = s"$path/${block.name}"
    Seq(
      addBlock("simulink/Ports & Subsystems/In1", blockPath)
    ) ++ commonProperties(path)
  }
}
