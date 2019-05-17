package actport.model.transform

import actport.model.{InputPort, InvalidPort, Model, OutputPort}
import monocle.macros.syntax.lens._

object RemoveInvalidLinks {
  /** Remove all links connected to ports mapped as invalid from model.
    *
    * @param model data model
    * @return filtered model
    */
  def apply(model: Model): Model =
    model.links.values.foldLeft(model) { (m, link) =>
      val startPort = {
        val key = (link.start.block, link.start.activatePort, OutputPort, link.linkType)
        m.portMap.get(key)
      }
      val endPort = {
        val key = (link.end.block, link.end.activatePort, InputPort, link.linkType)
        m.portMap.get(key)
      }
      if (startPort.contains(InvalidPort) || endPort.contains(InvalidPort)) {
        m.lens(_.links).modify(_ - link.id)
      } else m
    }
}
