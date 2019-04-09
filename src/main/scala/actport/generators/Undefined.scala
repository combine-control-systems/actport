package actport.generators

import actport.Block
import actport.simulink._

object Undefined extends Generator[Block] {
  override def apply(path: String)(implicit block: Block): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"

    val inputPorts = for (i <- 1 to block.inputCount) yield
      AddBlock("simulink/Ports & Subsystems/In1", s"$blockPath/In$i")

    val outputPorts = for (i <- 1 to block.outputCount) yield
      AddBlock("simulink/Ports & Subsystems/Out1", s"$blockPath/Out$i")

    val eventInputPort = if (block.eventInputCount == 1) {
      Seq(AddBlock("simulink/Ports & Subsystems/Trigger", s"$blockPath/Trigger"))
    } else Seq.empty

    val eventOutputPort = if (block.eventOutputCount == 1) {
      Seq(AddBlock("simulink/Ports & Subsystems/Out1", s"$blockPath/Event"))
    } else Seq.empty

    Seq(
      AddBlock("simulink/Ports & Subsystems/Subsystem", blockPath),
      DeleteLine(blockPath, "In1/1", "Out1/1"),
      DeleteBlock(s"$blockPath/In1"),
      DeleteBlock(s"$blockPath/Out1")
    ) ++ inputPorts ++ outputPorts ++ eventInputPort ++ eventOutputPort ++ commonProperties(path)
  }
}
