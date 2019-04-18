package actport.generators

import actport.ActivateBlock
import actport.simulink.{AddBlock, Expression, Simulink, SimulinkPath}

/** Derivative of signal. */
object Derivative extends Generator[ActivateBlock] {
  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name

    Seq(AddBlock(Simulink.Continuous.Derivative, blockPath)) ++ commonProperties(block, path)
  }
}