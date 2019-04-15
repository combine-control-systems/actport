package actport.simulink

/** Operations on values.
  *
  * @param s value string representation
  */
class ValueOps(val s: String) {
  /** Escapes all `'` with `''` in a string.
    *
    * @return escaped string
    */
  def escape: String = s.replace("'", "''")

  /** Escapes strings for [[actport.generators.Annotation]].
    *
    * Makes sure that multiline strings can be serialized to Matlab
    * script commands.
    *
    * @return escaped string
    */
  def escapeAnnotation: String =
    s.replace("'", "''") // all ' to ''
      .split("\n") // split all newlines
      .map("'" + _ + "'") // surround strings with '
      .mkString(",char(10),") // join and insert char(10) as newlines
}

/** Companion object. */
object ValueOps {
  /** Implicit converter of strings to [[actport.simulink.ValueOps]].
    *
    * @param s value string representation
    * @return string wrapped in [[actport.simulink.ValueOps]] class
    */
  implicit def stringToValue(s: String): ValueOps = new ValueOps(s)
}
