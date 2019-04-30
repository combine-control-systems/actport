package actport.transforms

import actport.simulink.{SetParam, SimParName, SimPath}
import actport.{Block, EventLink, InputPort, OutputPort, PortType, System}
import monocle.macros.syntax.lens._

import scala.collection.JavaConverters._
import scala.util.chaining._

object EventPortIndex {
  /** Update all indices of event ports to be correct and add corresponding port mappings, if needed.
    *
    * @param system
    * @return
    */
  def updatePortIndices(system: System): System = {
    system.children.zipWithIndex.foldLeft(system) { case (s, (block, index)) =>
      block match {
        case b: Block if b.blockType == "system/Ports/EventInput" => processPort(s, b, index, InputPort)
        case b: Block if b.blockType == "system/Ports/EventOutput" => processPort(s, b, index, OutputPort)
        case ss: System => s.lens(_.children).modify(_.updated(index, updatePortIndices(ss)))
        case _: Block => s
      }
    }
  }

  private def processPort(system: System, block: Block, index: Int, portType: PortType): System = {
    val portNumber = block.parameters.asScala.get("portNumber") match {
      case Some(p: String) => p.toInt
      case _ =>
        val pt = portType match {
          case InputPort => "EventInput"
          case OutputPort => "EventOutput"
        }
        throw new IllegalStateException(s"Port number is missing for $pt port ${block.name}.")
    }

    val simulinkPort = portType match {
      case InputPort => (system.inputCount + portNumber).toString
      case OutputPort => (system.outputCount + portNumber).toString
    }

    val mappedSystem = portType match {
      case InputPort =>
        // If we only have one event link we always have a trigger port. See actport_event_input.m.
        // This only applies to explicit port blocks from the OML-code. All other ports in subsystems
        // are generated using expressions and are not present explicitly as a Block.
        if (portNumber > 1) {
          system.addPortMapping(Map((portNumber, EventLink, InputPort) -> simulinkPort))
        } else system
      case OutputPort =>
        system.addPortMapping(Map((portNumber, EventLink, OutputPort) -> simulinkPort))
    }

    // Set the port parameter of the port block and update the block in the system.
    block.addExpression(SetParam(SimPath(block.name), Vector((SimParName("Port"), simulinkPort))))
      .pipe(b => mappedSystem.lens(_.children).modify(_.updated(index, b)))
  }
}
