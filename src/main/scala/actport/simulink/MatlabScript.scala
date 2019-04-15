package actport.simulink

/** Value class of a Matlab Script.
  *
  * @param script Matlab script as a string
  */
case class MatlabScript(script: String) extends AnyVal {
  override def toString: String = script
}
