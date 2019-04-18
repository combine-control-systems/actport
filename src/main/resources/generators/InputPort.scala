package actport.generators

import actport.ActivateBlock
import actport.simulink._

/** Input port of subsystem. */
object InputPort extends Generator[ActivateBlock] {
  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name
    Seq(
      AddBlock(Simulink.PortsAndSubsystems.In1, blockPath)
    ) ++ commonProperties(block, path)
  }
}
