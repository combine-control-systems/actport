package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

/** Concatenate matrices. */
object MatrixConcatenation extends Generator[ActivateBlock] {
  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala

    Seq(
      AddBlock(Simulink.MathOperations.MatrixConcatenate, blockPath),
      SetParam(blockPath, SimulinkParameterName("NumInputs"), p.get("nin") match {
        case Some(inputCount: String) => inputCount
        case _ => "2"
      }),
      SetParam(blockPath, SimulinkParameterName("Mode"), "Multidimensional array"),
      SetParam(blockPath, SimulinkParameterName("ConcatenateDimension"), p.get("method") match {
        case Some("'Horizontal'") => "2"
        case Some("'Vertical'") => "1"
        case _ => "1"
      })
    ) ++ commonProperties(block, path)
  }
}
