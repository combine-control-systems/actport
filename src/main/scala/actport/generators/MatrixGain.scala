package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

object MatrixGain extends Generator[ActivateBlock] {
  override def apply(path: String)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"

    val p = block.parameters.asScala

    Seq(
      AddBlock("simulink/Math Operations/Gain", blockPath),
      SetParam(blockPath, "Gain", p.get("gain") match {
        case Some(s: String) => s
        case _ => "1.0"
      }),
      SetParam(blockPath, "SaturateOnIntegerOverflow",
        p.get("overflow") match {
          case Some(s: String) if s == "'Saturate'" => "on"
          case Some(s: String) if s == "'Nothing'" => "off"
          case Some(s: String) if s == "'Error'" => "off"  // TODO: Handle "Error" case properly.
          case _ => "off"
        }),
      SetParam(blockPath, "Multiplication",
        p.get("mulmethod") match {
          case Some(s: String) if s == "'Gain.*u1'" => "Element-wise(K.*u)"
          case Some(s: String) if s == "'Gain*u1'" => "Matrix(K*u)"
          case Some(s: String) if s == "'u1*Gain'" => "Matrix(u*K)"
          case _ => "Matrix(K*u)"
        })
    ) ++ commonProperties(path)
  }
}