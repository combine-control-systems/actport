package actport.generators

import actport.simulink._
import actport.{ActivateBlock, ActivateStruct}

import scala.collection.JavaConverters._

object MatrixMultiplication extends Generator[ActivateBlock] {
  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala

    Seq(
      AddBlock(Simulink.MathOperations.Product, blockPath),
      SetParam(blockPath, SimulinkParameterName("Multiplication"), "Matrix(*)"),
      SetParam(blockPath, SimulinkParameterName("Inputs"), p.get("in_ports") match {
        case Some(dict: ActivateStruct) => dict.asScala.get("sgn") match {
          case Some(signs: Array[String]) => signs.map(_.replace("'", "")).mkString
          case _ => "**" // TODO: What should the default case be?
        }
        case _ => "**"
      })
    ) ++ commonProperties(path)
  }
}
