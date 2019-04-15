package actport.simulink

/** Value class for a Simulink port.
  *
  * @param port port name according to "blockname/portnumber"
  */
case class SimulinkPort(port: String) extends AnyVal {
  override def toString: String = port
}
