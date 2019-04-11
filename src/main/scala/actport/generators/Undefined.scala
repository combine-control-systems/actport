package actport.generators

import actport.Block
import actport.simulink._

object Undefined extends Generator[Block] {
  override def apply(path: SimulinkPath)(implicit block: Block): Seq[Expression] = {
    val blockPath = path / block.name

    val inputPorts = for (i <- 1 to block.inputCount) yield
      AddBlock(Simulink.PortsAndSubsystems.In1, blockPath / s"In$i")

    val outputPorts = for (i <- 1 to block.outputCount) yield
      AddBlock(Simulink.PortsAndSubsystems.Out1, blockPath / s"Out$i")

    val eventInputPort = if (block.eventInputCount == 1) {
      Seq(AddBlock(Simulink.PortsAndSubsystems.Trigger, blockPath / "Trigger"))
    } else Seq.empty

    val eventOutputPort = if (block.eventOutputCount == 1) {
      Seq(AddBlock(Simulink.PortsAndSubsystems.Out1, blockPath / "Event"))
    } else Seq.empty

    Seq(
      AddBlock(Simulink.PortsAndSubsystems.Subsystem, blockPath),
      DeleteLine(blockPath, SimulinkPort("In1/1"), SimulinkPort("Out1/1")),
      DeleteBlock(blockPath / "In1"),
      DeleteBlock(blockPath / "Out1")
    ) ++ inputPorts ++ outputPorts ++ eventInputPort ++ eventOutputPort ++ commonProperties(path)
  }
}
