package actport.generators

import actport.ActivateBlock
import actport.simulink._

object Mux extends Generator[ActivateBlock] {
  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = path / block.name

    Seq(
      AddBlock(Simulink.SignalRouting.Mux, blockPath),
      SetParam(blockPath, SimulinkParameterName("Inputs"), block.inputCount)
    ) ++ commonProperties(path)
  }
}
