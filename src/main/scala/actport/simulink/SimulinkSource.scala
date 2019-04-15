package actport.simulink

/** Value class for Simulink Sources.
  *
  * A Simulink Source is a path to a specific block in a Simulink library.
  * For example, the path to the Gain block in Simulink is
  * `simulink/Math Operations/Gain`.
  *
  * @see [[actport.simulink.Simulink]]
  *
  * @param name name of Simulink Source
  */
case class SimulinkSource(name: String) extends AnyVal {
  override def toString: String = name
}
