package actport.simulink

case class SimulinkPort(port: String) extends AnyVal {
  override def toString: String = port
}
