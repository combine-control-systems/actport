package actport.simulink

/** Value class of a path to a block in a Simulink model.
  *
  * A Simulink path can be `modelname/subsystem/block`
  *
  * @param path string representation of the path
  */
case class SimulinkPath(path: String) extends AnyVal {
  /** Appends an extra component to a [[actport.simulink.SimulinkPath]].
    *
    * Usage:
    * {{{
    *   val path = SimulinkPath("modelname/subsystem")  // points at a subsystem
    *   val blockPath = path / "block" // points at "block" in subsystem
    * }}}
    *
    * @param next next path component
    * @return joined components
    */
  def /(next: String): SimulinkPath = SimulinkPath(path + "/" + next)

  override def toString: String = path
}
