package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

object MatrixGain extends Generator[ActivateBlock] {
  override def apply(path: String)(implicit block: ActivateBlock): Seq[String] = {
    val blockPath = s"$path/${block.name}"

    val p = block.parameters.asScala

    Seq(
      addBlock("simulink/Math Operations/Gain", blockPath),
      setParam(blockPath, "Gain", p.get("gain") match {
        case Some(c: Char) => s"$c"
        case Some(s: String) => s
        case _ => "1.0"
      }),
      setParam(blockPath, "SaturateOnIntegerOverflow",
        p.get("overflow") match {
          case Some(s: String) if s == "''Saturate''" => "on"
          case Some(s: String) if s == "''Nothing''" => "off"
          case Some(s: String) if s == "''Error''" => "off"  // TODO: Handle "Error" case properly.
          case _ => "off"
        }),
      setParam(blockPath, "Multiplication",
        p.get("mulmethod") match {
          case Some(s: String) if s == "''Gain.*u1''" => "Element-wise(K.*u)"
          case Some(s: String) if s == "''Gain*u1''" => "Matrix(K*u)"
          case Some(s: String) if s == "''u1*Gain''" => "Matrix(u*K)"
          case _ => "Matrix(K*u)"
        })
    ) ++ commonProperties(path)
  }
}
