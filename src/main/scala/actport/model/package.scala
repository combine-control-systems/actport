package actport

package object model {
  /** Type of parameter values. */
  type ParameterValue = Any
  /** Type of block parameter dictionary. */
  type BlockParameters = Map[ParameterName, ParameterValue]

  /** Value class for Activate identifiers.
    *
    * @param value Activate identifier like `system/SignalViewers/Scope`
    */
  case class ActivateId(value: String) extends AnyVal


  /** ADT for link types. */
  sealed trait LinkType

  /** Explicit link. */
  case object ExplicitLink extends LinkType

  /** Event link. */
  case object EventLink extends LinkType

  /** Start information of link. */
  case class LinkStart(block: BlockId, activatePort: ActivatePort)

  /** End information of link. */
  case class LinkEnd(block: BlockId, activatePort: ActivatePort)

  /** ADT for port types. */
  sealed trait PortType

  /** Input port type. */
  case object InputPort extends PortType

  /** Output port type. */
  case object OutputPort extends PortType

  /** Value class for Activate port indices.
    *
    * @param value Activate port index
    */
  case class ActivatePort(value: Int) extends AnyVal

  /** Value class of block identifiers.
    *
    * @param value block identifier
    */
  case class BlockId(value: Long) extends AnyVal

  /** Value class of block names.
    *
    * @param value name of block
    */
  case class BlockName(value: String) extends AnyVal

  /** Value class of link identifiers.
    *
    * @param value link identifier
    */
  case class LinkId(value: Long) extends AnyVal

  /** Value class of parameter names.
    *
    * @param value parameter name
    */
  case class ParameterName(value: String) extends AnyVal

  /** Value class of mask parameter names.
    *
    * @param value mask parameter name
    */
  case class MaskParameterName(value: String) extends AnyVal
}
