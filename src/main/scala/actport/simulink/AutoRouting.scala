package actport.simulink

/** Auto-routing options. */
sealed trait AutoRouting {
  def value: String
}

/** No auto routing. */
case object DisableAutoRouting extends AutoRouting {
  override def value: String = "off"
}

/** Auto routing enabled. */
case object EnableAutoRouting extends AutoRouting {
  override def value: String = "on"
}

/** Smart auto routing. */
case object SmartAutoRouting extends AutoRouting {
  override def value: String = "smart"
}
