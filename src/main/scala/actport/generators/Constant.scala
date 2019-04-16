package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

/** Constant signal. */
object Constant extends Generator[ActivateBlock] {
  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala

    Seq(
      AddBlock(Simulink.Sources.Constant, blockPath),
      p.get("C") match {
        case Some(constant: String) => SetParam(blockPath, SimulinkParameterName("Value"), constant)
        case _ => SetParam(blockPath, SimulinkParameterName("Value"), "1")
      }
      // TODO: For matrices and vectors we need to turn off the parameter "VectorParams1D".
      //       The question is how to identify when to do this without parsing the parameter value?
      //       It gets especially tricky when the value is a variable to be read from the workspace.
      // TODO: We are not handling the datatype of the signal which is specified in p.get("typ").
    ) ++ commonProperties(block, path)
  }
}
