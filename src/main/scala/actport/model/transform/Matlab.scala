package actport.model.transform

import actport.model.Model
import actport.model.transforms.RemoveSplitBlocks

object Matlab {
  def remove_split_blocks(model: Model): Model = RemoveSplitBlocks(model)
}
