package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

/** Signal gain. */
object Gain extends Generator[ActivateBlock] {
  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala

    Seq(
      AddBlock(Simulink.MathOperations.Gain, blockPath),
      p.get("gain") match {
        case Some(gain: String) => SetParam(blockPath, SimulinkParameterName("Gain"), gain)
        case _ => SetParam(blockPath, SimulinkParameterName("Gain"), "1")
      }
    ) ++ commonProperties(block, path)
  }
}
