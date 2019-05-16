package actport.model.transform

import actport.model.Model

/** Matlab interface for model transforms. */
object Matlab {
  /** Eliminate sample clock blocks from model.
    *
    * @param model data model
    * @return updated data model
    */
  def eliminate_sample_clock_blocks(model: Model): Model = EliminateSampleClock(model)

  /** Map event ports such that their indices are located after the explicit ports.
    *
    * @param model data model
    * @return updated data model
    */
  def map_event_ports(model: Model): Model = MapEventPorts(model)

  /** Remove split blocks from model.
    *
    * @param model data model
    * @return updated data model
    */
  def remove_split_blocks(model: Model): Model = RemoveSplitBlocks(model)

  /** Remove illegal links from model.
    *
    * @param model data model
    * @return updated data model
    */
  def remove_illegal_links(model: Model): Model = RemoveIllegalLinks(model)
}
