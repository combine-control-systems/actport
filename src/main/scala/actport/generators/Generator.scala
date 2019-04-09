package actport.generators

import actport.Block
import actport.simulink.Expression

trait Generator[A <: Block] {
  def apply(path: String)(implicit block: A): Seq[Expression]
}
