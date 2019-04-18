package actport.generators

import actport.ActivateBlock
import actport.simulink._

/** Demultiplexer. */
object Demux extends Generator[ActivateBlock] {
  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name

    Seq(
      AddBlock(Simulink.SignalRouting.Demux, blockPath),
      SetParam(blockPath, SimulinkParameterName("Outputs"), block.outputCount)
    ) ++ commonProperties(block, path)
  }
}
