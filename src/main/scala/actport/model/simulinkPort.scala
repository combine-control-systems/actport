package actport.model

/** ADT for Simulink ports. */
sealed trait SimulinkPort

/** Invalid Simulink port.
  *
  * Used when any link to the given port
  * should be removed.
  */
case object InvalidPort extends SimulinkPort

/** Mapped Simulink port.
  *
  * Used when a link should be routed to a different port than the index of the Activate port.
  *
  * @param name name of the mapped port
  */
case class MappedPort(name: String) extends SimulinkPort

object MappedPort {
  /** Create a mapped port from an integer.
    *
    * @param index integral port index
    * @return mapped port
    */
  def apply(index: Int): MappedPort = MappedPort(index.toString)
}
