package actport.generators

import actport.ActivateBlock
import actport.simulink.{AddBlock, Expression, Simulink}

object Derivative extends Generator[ActivateBlock] {
  override def apply(path: String)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"

    Seq(AddBlock(Simulink.Continuous.Derivative, blockPath)) ++ commonProperties(path)
  }
}
