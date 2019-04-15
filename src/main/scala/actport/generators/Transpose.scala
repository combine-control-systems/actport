package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

/** Transpose of Matrix. */
object Transpose extends Generator[ActivateBlock] {
  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala

    Seq(
      AddBlock(Simulink.MathOperations.MathFunction, blockPath),
      p.get("rule") match {
        case Some("'Transpose'") =>
          SetParam(blockPath, SimulinkParameterName("Operator"), "transpose")
        case Some("'Hermitian(Transpose-Conjugate)'") =>
          SetParam(blockPath, SimulinkParameterName("Operator"), "hermitian")
        case _ =>
          SetParam(blockPath, SimulinkParameterName("Operator"), "transpose")
      }
    ) ++ commonProperties(path)
  }
}
