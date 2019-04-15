package actport.generators

import actport.Block
import actport.simulink.{Expression, SimulinkPath}

/** Generator trait. */
trait Generator[A <: Block] {
  /** Generates a sequence of expressions to create a Simulink representation.
    *
    * @param path  location of block
    * @param block block instance
    * @return sequence of expressions
    */
  def apply(path: SimulinkPath)(implicit block: A): Seq[Expression]
}
