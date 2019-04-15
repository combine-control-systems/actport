package actport

import actport.simulink._

package object generators {
  /** Dispatch block to generate expressions.
    *
    * @param path  path in diagram
    * @param block Activate block identifier
    * @return sequence of expressions to create the block in Simulink
    */
  def dispatch(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    // Keep these in alphabetical order.
    // TODO: Break generators out into separate jar-files and use reflection to
    //       look up matching strings. Contributing with extra functionality
    //       by just dropping new jar-files into a predefined directory is
    //       probably desired.
    block.blockType match {
      case "system/ActivationOperations/SampleClock" => generators.SampleClock(path)
      case "system/Dynamical/ContStateSpace" => generators.StateSpace(path)
      case "system/Dynamical/DiscreteDelay" => generators.DiscreteDelay(path)
      case "system/Dynamical/DiscrStateSpace" => generators.DiscreteStateSpace(path)
      case "system/Dynamical/Derivative" => generators.Derivative(path)
      case "system/Dynamical/Integral" => generators.Integral(path)
      case "system/MathOperations/Gain" => generators.Gain(path)
      case "system/MatrixOperations/MatrixConcatenation" => generators.MatrixConcatenation(path)
      case "system/MathOperations/MathFunc" => generators.MathFunc(path)
      case "system/MathOperations/Sum" => generators.Sum(path)
      case "system/MatrixOperations/MatrixGain" => generators.MatrixGain(path)
      case "system/MatrixOperations/MatrixMultiplication" => generators.MatrixMultiplication(path)
      case "system/MatrixOperations/Transpose" => generators.Transpose(path)
      case "system/Ports/Input" => generators.InputPort(path)
      case "system/Ports/Output" => generators.OutputPort(path)
      case "system/Routing/Demux" => generators.Demux(path)
      case "system/Routing/Mux" => generators.Mux(path)
      case "system/SignalGenerators/Constant" => generators.Constant(path)
      case "system/SignalGenerators/Random" => generators.Random(path)
      case "system/SignalViewers/Scope" => generators.Scope(path)
      case "TEXT_f" => generators.Annotation(path)
      case _ => generators.Undefined(path)
    }
  }

  /** Apply common properties.
    *
    * @param path  block path
    * @param block Activate block
    * @return sequence of expressions
    */
  def commonProperties(path: SimulinkPath)(implicit block: Block): Seq[Expression] = {
    val blockPath = path / block.name
    Seq(
      SetParam(blockPath, SimulinkParameterName("BackgroundColor"), block.backgroundColor),
      SetParam(blockPath, SimulinkParameterName("ForegroundColor"), block.foregroundColor),
      SetParam(blockPath, SimulinkParameterName("Position"), block.rect),
      SetParam(blockPath, SimulinkParameterName("Orientation"), if (block.flip) "left" else "right")
    )
  }
}
