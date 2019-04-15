package actport.simulink

object BuiltIn {
  @inline private def expand(s: String): SimulinkSource = SimulinkSource("built-in/" + s)
  def Area: SimulinkSource = expand("Area")
}
