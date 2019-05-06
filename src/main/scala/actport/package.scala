import actport.oml.{LinkType, PortType}

package object actport {
  type PortKey = (Int, LinkType, PortType)
  type PortMap = Map[PortKey, String]
}
