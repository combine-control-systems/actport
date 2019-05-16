package actport.model

import actport.oml.ParsedEntity

/** Port count information of Activate ports.
  *
  * @param explicitInputCount  number of explicit input ports
  * @param explicitOutputCount number of explicit output ports
  * @param eventInputCount     number of event input ports
  * @param eventOutputCount    number of event output ports
  */
case class ActivatePortInfo(explicitInputCount: Int,
                            explicitOutputCount: Int,
                            eventInputCount: Int,
                            eventOutputCount: Int)

object ActivatePortInfo {
  /** Create port info from a parsed entity.
    *
    * @param p the parsed entity from which the port info is extracted
    * @return port info
    */
  def apply(p: ParsedEntity): ActivatePortInfo =
    ActivatePortInfo(p.inputCount, p.outputCount, p.eventInputCount, p.eventOutputCount)
}
