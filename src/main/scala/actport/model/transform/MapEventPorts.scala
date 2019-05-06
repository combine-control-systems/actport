package actport.model.transform

import actport.model._
import monocle.macros.syntax.lens._

import scala.util.chaining._

object MapEventPorts {
  /** Map event ports after explicit ports.
    *
    * @param model data model
    * @return updated model
    */
  def apply(model: Model): Model = processLinks(model)

  @throws[NoSuchElementException]("if blocks do not exist")
  private def processLinks(model: Model): Model =
    model.links.values.foldLeft(model) { (m, link) =>
      link.linkType match {
        case EventLink =>
          val startBlock = model.blocks.values.find(_.id == link.start.block)
          val endBlock = model.blocks.values.find(_.id == link.end.block)
          (startBlock, endBlock) match {
            case (Some(b1), Some(b2)) =>
              // Add portmap for start block.
              model.lens(_.portMap).modify { pm =>
                val key = (b1.id, link.start.activatePort, OutputPort, link.linkType)
                pm + (key -> MappedPort(b1.ports.explicitOutputCount + link.start.activatePort.index))
                // Add portmap for end block.
              }.pipe(_.lens(_.portMap).modify { pm =>
                val key = (b2.id, link.end.activatePort, InputPort, link.linkType)
                pm + (key -> MappedPort(b2.ports.explicitInputCount + link.end.activatePort.index))
              })
            case (Some(_), None) => throw new NoSuchElementException(s"could not find end block of link ${link.id}")
            case (None, Some(_)) => throw new NoSuchElementException(s"could not find start block of link ${link.id}")
            case (None, None) => throw new NoSuchElementException(s"could not find start and end " +
              s"blocks of link ${link.id}")
          }
        case ExplicitLink => m
      }
    }
}
