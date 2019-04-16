package actport.generators

import actport.ActivateBlock
import actport.simulink._

/** All blocks not handled by [[actport.generators.getGenerator]] become [[Undefined]]. */
object Undefined extends Generator[ActivateBlock] {
  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
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

    Seq(AddCleanSubsystem(blockPath)) ++
      inputPorts ++ outputPorts ++ eventInputPort ++ eventOutputPort ++ commonProperties(block, path)
  }
}
