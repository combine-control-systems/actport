package actport.model.transform

import actport.model.Model

object Matlab {
  def eliminate_sample_clock_blocks(model: Model): Model = EliminateSampleClock(model)
  def map_event_ports(model: Model): Model = MapEventPorts(model)
  def remove_split_blocks(model: Model): Model = RemoveSplitBlocks(model)
  def remove_illegal_links(model: Model): Model = RemoveIllegalLinks(model)
}
