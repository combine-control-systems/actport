package actport.simulink

class ValueOps(val s: String) {
  def escape: String = s.replace("'", "''")
}

object ValueOps {
  implicit def stringToValue(s: String): ValueOps = new ValueOps(s)
}
