package actport.simulink

class ValueOps(val s: String) {
  def escape: String = s.replace("'", "''")
  def escapeAnnotation: String =
    s.replace("'", "''") // all ' to ''
    .split("\n")                     // split all newlines
    .map("'" + _ + "'")                     // surround strings with '
    .mkString(",char(10),")                 // join and insert char(10) as newlines
}

object ValueOps {
  implicit def stringToValue(s: String): ValueOps = new ValueOps(s)
}
