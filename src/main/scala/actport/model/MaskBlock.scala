
package actport.model

import actport.oml.ParsedEntity
import monocle.macros.syntax.lens._

import scala.collection.JavaConverters._
import scala.util.chaining._

/** Create mask for block. */
object MaskBlock {
  /** Convert the mask information of a parsed entity.
    *
    * @param parsedEntity the parsed entity
    * @param block        the block of the data model
    * @return updated block
    */
  def apply(parsedEntity: ParsedEntity)(block: Block): Block = {
    parsedEntity.mask.map(_.asScala.toMap) match {
      case Some(mask) =>
        mask.keys
          .foldLeft(Map.empty[MaskParameterName, MaskParameter]) { (m, name) =>
            m + (MaskParameterName(name) -> MaskParameter(name, mask))
          }.pipe(m => block.lens(_.mask).set(m))
      case None => block // Do nothing.
    }
  }
}
