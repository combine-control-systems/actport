package actport

package object model {
  type ParameterValue = Any
  type BlockParameters = Map[ParameterName, ParameterValue]

  case class ActivateId(id: String) extends AnyVal


  sealed trait LinkType
  case object ExplicitLink extends LinkType
  case object EventLink extends LinkType

  case class LinkStart(block: BlockId, activatePort: ActivatePort)
  case class LinkEnd(block: BlockId, activatePort: ActivatePort)

  sealed trait PortType
  case object InputPort extends PortType
  case object OutputPort extends PortType

  case class ActivatePort(index: Int) extends AnyVal

  sealed trait SimulinkPort
  case object InvalidPort extends SimulinkPort
  case class MappedPort(name: String) extends SimulinkPort
  object MappedPort {
    def apply(index: Int): MappedPort = MappedPort(index.toString)
  }

  case class BlockId(id: Long) extends AnyVal
  case class BlockName(name: String) extends AnyVal
  case class LinkId(id: Long) extends AnyVal
  case class ParameterName(name: String) extends AnyVal

  case class MaskParameterName(name: String) extends AnyVal
}
