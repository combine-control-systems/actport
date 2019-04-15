package actport.simulink

/** Value class of a parameter name in Simulink.
  *
  * @param parameterName name of parameter
  */
case class SimulinkParameterName(parameterName: String) extends AnyVal {
  override def toString: String = parameterName
}
