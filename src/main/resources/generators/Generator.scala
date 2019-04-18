package actport.generators

import actport.simulink.{Expression, SimulinkPath}
import actport.{Block, LinkType}

/** Generator trait. */
trait Generator[A <: Block] {
  /** Generates a sequence of expressions to create a Simulink representation.
    *
    * @param path  location of block
    * @param block block instance
    * @return sequence of expressions
    */
  def generateExpressions(block: A, path: SimulinkPath): Seq[Expression]

  /** Returns the corresponding port name in Simulink for an Activate Input Port.
    *
    * Default implementation just returns the unmodified index as a string.
    *
    * @param block        block with port
    * @param activatePort Activate port index
    * @param portType     type of port
    * @return Simulink name of port
    */
  def inputPortMapping(block: A, activatePort: Int, portType: LinkType): String = activatePort.toString

  /** Returns the corresponding port name in Simulink for an Activate Output Port.
    *
    * Default implementation just returns the unmodified index as a string.
    *
    * @param block        block with port
    * @param activatePort Activate port index
    * @param portType     type of port
    * @return Simulink name of port
    */
  def outputPortMapping(block: A, activatePort: Int, portType: LinkType): String = activatePort.toString
}
