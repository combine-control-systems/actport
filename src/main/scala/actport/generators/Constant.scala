package actport.generators

import actport.ActivateBlock
import actport.simulink.{AddBlock, Expression, SetParam}

import scala.collection.JavaConverters._

object Constant extends Generator[ActivateBlock] {
  override def apply(path: String)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"

    val p = block.parameters.asScala

    Seq(
      AddBlock("simulink/Sources/Constant", blockPath),
      p.get("C") match {
        case Some(constant: String) => SetParam(blockPath, "Value", constant)
        case _ => SetParam(blockPath, "Value", "1")
      }
      // TODO: For matrices and vectors we need to turn off the parameter "VectorParams1D".
      //       The question is how to identify when to do this.
      // TODO: We are not handling the datatype of the signal which is specified in p.get("typ").
    ) ++ commonProperties(path)
  }
}
