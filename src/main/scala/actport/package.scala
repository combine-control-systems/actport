package object actport {
  type PortKey = (Int, LinkType, PortType)
  type PortMap = Map[PortKey, String]
}
