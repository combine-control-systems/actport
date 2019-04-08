package actport

package object generators {
  def dispatch(implicit block: ActivateBlock, path: String): Seq[String] = {
    block.blockType match {
      case "system/MathOperations/Sum" => generators.Sum(path)
      case "system/Ports/Input" => generators.InputPort(path)
      case "system/Ports/Output" => generators.OutputPort(path)
      case "system/SignalViewers/Scope" => generators.Scope(path)
      case _ => generators.Undefined(path)
    }
  }
}
