package actport.simulink

case class SimulinkParameterName(parameterName: String) extends AnyVal {
  override def toString: String = parameterName
}
