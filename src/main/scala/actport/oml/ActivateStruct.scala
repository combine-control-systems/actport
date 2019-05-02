package actport.oml

class ActivateStruct extends java.util.HashMap[String, Any]

/** Alias for HashMap to be used for sending Matlab structs to Scala.
  *
  * Matlab does not serialize structs automatically when sending to a
  * Java function as an argument. Also, due to type erasure it is not
  * possible to specify generic types in Matlab. This is a way to
  * avoid that problem, but all structs need to be converted to an
  * `ActivateStruct` instead. This can be done using the Matlab
  * function src/main/matlab/convert_struct.m.
  */
object ActivateStruct {
  def empty = new ActivateStruct()
}
