package actport.generators

import actport.simulink._
import actport.{ActivateBlock, ActivateStruct}

object Sum extends Generator[ActivateBlock] {
  override def apply(path: String)(implicit block: ActivateBlock): Seq[String] = {
    val blockPath = s"$path/${block.name}"

    // This is a partial expression which does not handle cases where the type matching fails.
    val signs = block.parameters.get("in_ports") match {
      case s1: ActivateStruct => s1.get("sgn") match {
        case s2: Array[String] => s2.map(_.replace("'", "")).mkString
      }
    }

    Seq(
      addBlock("simulink/Math Operations/Add", blockPath),
      setParam(blockPath, "Inputs", signs)
    ) ++ commonProperties(path)
  }
}
