package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

object Gain extends Generator[ActivateBlock] {
  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala

    Seq(
      AddBlock(Simulink.MathOperations.Gain, blockPath),
      p.get("gain") match {
        case Some(gain: String) => SetParam(blockPath, SimulinkParameterName("Gain"), gain)
        case _ => SetParam(blockPath, SimulinkParameterName("Gain"), "1")
      }
    ) ++ commonProperties(path)
  }
}
