package actport.generators

import actport.ActivateBlock
import actport.simulink._

/** Signal scope. */
object Scope extends Generator[ActivateBlock] {
  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name
    Seq(
      AddBlock(Simulink.Sinks.Scope, blockPath),
      SetParam(blockPath, SimulinkParameterName("NumInputPorts"), block.inputCount)
    ) ++ commonProperties(block, path)
  }
}
