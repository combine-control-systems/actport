package actport.generators

import actport.ActivateBlock
import actport.simulink._

/** Output port of subsystem. */
object OutputPort extends Generator[ActivateBlock] {
  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name
    Seq(
      AddBlock(Simulink.PortsAndSubsystems.Out1, blockPath)
    ) ++ commonProperties(block, path)
  }
}
