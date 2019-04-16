package actport.generators

import actport.ActivateBlock
import actport.simulink._

/** Signal multiplexer. */
object Mux extends Generator[ActivateBlock] {
  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name

    Seq(
      AddBlock(Simulink.SignalRouting.Mux, blockPath),
      SetParam(blockPath, SimulinkParameterName("Inputs"), block.inputCount)
    ) ++ commonProperties(block, path)
  }
}
