package actport.generators

import actport.Block
import actport.simulink._

object OutputPort extends Generator[Block] {
  override def apply(path: SimulinkPath)(implicit block: Block): Seq[Expression] = {
    val blockPath = path / block.name
    Seq(
      AddBlock(Simulink.PortsAndSubsystems.Out1, blockPath)
    ) ++ commonProperties(path)
  }
}
