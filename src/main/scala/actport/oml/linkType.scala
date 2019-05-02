package actport.oml

/** Link type ADT. */
sealed trait LinkType

/** Explicit link. */
case object ExplicitLink extends LinkType

/** Event link. */
case object EventLink extends LinkType

/** Implicit link. */
case object ImplicitLink extends LinkType
