package actport.model

import actport.oml.ParsedEntity

case class ActivatePortInfo(explicitInputCount: Int,
                            explicitOutputCount: Int,
                            eventInputCount: Int,
                            eventOutputCount: Int)

object ActivatePortInfo {
  def apply(p: ParsedEntity): ActivatePortInfo =
    ActivatePortInfo(p.inputCount, p.outputCount, p.eventInputCount, p.eventOutputCount)
}
