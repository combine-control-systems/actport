package actport.simulink

sealed trait AutoRouting {
  def value: String
}

case object DisableAutoRouting extends AutoRouting { override def value: String = "off" }
case object EnableAutoRouting extends AutoRouting { override def value: String = "on" }
case object SmartAutoRouting extends AutoRouting { override def value: String = "smart" }
