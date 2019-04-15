package actport.generators

import actport.Block
import actport.simulink._

/** Signal scope. */
object Scope extends Generator[Block] {
  override def apply(path: SimulinkPath)(implicit block: Block): Seq[Expression] = {
    val blockPath = path / block.name
    Seq(
      AddBlock(Simulink.Sinks.Scope, blockPath),
      SetParam(blockPath, SimulinkParameterName("NumInputPorts"), block.inputCount)
    ) ++ commonProperties(path)
  }
}
