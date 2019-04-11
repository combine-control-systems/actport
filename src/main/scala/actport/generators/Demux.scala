package actport.generators

import actport.ActivateBlock
import actport.simulink._

object Demux extends Generator[ActivateBlock] {
  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = path / block.name

    Seq(
      AddBlock(Simulink.SignalRouting.Demux, blockPath),
      SetParam(blockPath, SimulinkParameterName("Outputs"), block.outputCount)
    ) ++ commonProperties(path)
  }
}
