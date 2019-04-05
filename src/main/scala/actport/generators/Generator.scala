package actport.generators

import actport.Block

trait Generator[A <: Block] {
  def apply(path: String)(implicit block: A): Seq[String]
}
