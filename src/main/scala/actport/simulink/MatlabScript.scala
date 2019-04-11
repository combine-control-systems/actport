package actport.simulink

case class MatlabScript(script: String) extends AnyVal {
  override def toString: String = script
}
