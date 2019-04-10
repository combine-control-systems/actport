package actport.generators

import actport.ActivateBlock
import actport.simulink.{AddBlock, Expression, SetParam}

import scala.collection.JavaConverters._

object Gain extends Generator[ActivateBlock] {
  override def apply(path: String)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"

    val p = block.parameters.asScala

    Seq(
      AddBlock("simulink/Math Operations/Gain", blockPath),
      p.get("gain") match {
        case Some(gain: String) => SetParam(blockPath, "Gain", gain)
        case _ => SetParam(blockPath, "Gain", "1")
      }
    ) ++ commonProperties(path)
  }
}
