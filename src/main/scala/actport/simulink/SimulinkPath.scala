package actport.simulink

case class SimulinkPath(path: String) extends AnyVal {
  def /(next: String): SimulinkPath = SimulinkPath(path + "/" + next)

  override def toString: String = path
}
