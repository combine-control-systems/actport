import actport.oml.{LinkType, PortType}

package object actport {
  /** Dictionary key for ports.
    *
    * 1: Port index.
    * 2: Type of link (explicit or event).
    * 3: Type of port (input or output).
    */
  type PortKey = (Int, LinkType, PortType)

  /** Port map type.
    *
    * Always maps the key of the port to a string
    * containing the name of a Simulink port.
    */
  type PortMap = Map[PortKey, String]
}
