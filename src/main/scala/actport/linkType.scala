package actport

trait LinkType
case object ExplicitLink extends LinkType
case object EventLink extends LinkType
case object ImplicitLink extends LinkType
