package actport.generators

import actport.Block
import actport.simulink.{Expression, SimulinkPath}

trait Generator[A <: Block] {
  def apply(path: SimulinkPath)(implicit block: A): Seq[Expression]
}
