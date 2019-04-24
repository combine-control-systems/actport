package actport

/** Port type ADT. */
sealed trait PortType

/** Input port. */
case object InputPort extends PortType

/** Output port. */
case object OutputPort extends PortType
