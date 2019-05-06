package actport.model.transform

import actport.model.Model

object Matlab {
  def map_event_ports(model: Model): Model = MapEventPorts(model)
  def remove_split_blocks(model: Model): Model = RemoveSplitBlocks(model)
  def remove_illegal_links(model: Model): Model = RemoveIllegalLinks(model)
}
