package actport

package object model {
  type ParameterValue = Any
  type BlockParameters = Map[ParameterName, ParameterValue]

  case class ActivateId(id: String) extends AnyVal


  sealed trait LinkType
  case object ExplicitLink extends LinkType
  case object EventLink extends LinkType

  case class LinkStart(block: BlockId, activatePort: ActivatePort, simulinkPort: Option[SimulinkPort] = None)
  case class LinkEnd(block: BlockId, activatePort: ActivatePort, simulinkPort: Option[SimulinkPort] = None)

  case class ActivatePort(index: Int) extends AnyVal
  case class SimulinkPort(name: String) extends AnyVal

  case class BlockId(id: Long) extends AnyVal
  case class BlockName(name: String) extends AnyVal
  case class LinkId(id: Long) extends AnyVal
  case class ParameterName(name: String) extends AnyVal
}
