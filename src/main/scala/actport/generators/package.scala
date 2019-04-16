package actport

import actport.simulink._

package object generators {
  /** Dispatch block to generate expressions.
    *
    * @param block Activate block identifier
    * @return sequence of expressions to create the block in Simulink
    */
  def getGenerator(block: ActivateBlock): Generator[ActivateBlock] = {
    // Keep these in alphabetical order.
    // TODO: Break generators out into separate jar-files and use reflection to
    //       look up matching strings. Contributing with extra functionality
    //       by just dropping new jar-files into a predefined directory is
    //       probably desired.
    block.blockType match {
      case "system/ActivationOperations/SampleClock" => generators.SampleClock
      case "system/Dynamical/ContStateSpace" => generators.StateSpace
      case "system/Dynamical/DiscreteDelay" => generators.DiscreteDelay
      case "system/Dynamical/DiscrStateSpace" => generators.DiscreteStateSpace
      case "system/Dynamical/Derivative" => generators.Derivative
      case "system/Dynamical/Integral" => generators.Integral
      case "system/MathOperations/Gain" => generators.Gain
      case "system/MatrixOperations/MatrixConcatenation" => generators.MatrixConcatenation
      case "system/MathOperations/MathFunc" => generators.MathFunc
      case "system/MathOperations/Sum" => generators.Sum
      case "system/MatrixOperations/MatrixGain" => generators.MatrixGain
      case "system/MatrixOperations/MatrixMultiplication" => generators.MatrixMultiplication
      case "system/MatrixOperations/Transpose" => generators.Transpose
      case "system/Ports/Input" => generators.InputPort
      case "system/Ports/Output" => generators.OutputPort
      case "system/Routing/Demux" => generators.Demux
      case "system/Routing/Mux" => generators.Mux
      case "system/SignalGenerators/Constant" => generators.Constant
      case "system/SignalGenerators/Random" => generators.Random
      case "system/SignalViewers/Display" => generators.Display
      case "system/SignalViewers/Scope" => generators.Scope
      case "TEXT_f" => generators.Annotation
      case _ => generators.Undefined
    }
  }

  def getGenerator(block: ActivateSuperBlock): Generator[ActivateSuperBlock] = generators.SuperBlock

  /** Apply common properties.
    *
    * @param path  block path
    * @param block Activate block
    * @return sequence of expressions
    */
  def commonProperties(block: Block, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name
    Seq(
      SetParam(blockPath, SimulinkParameterName("BackgroundColor"), block.backgroundColor),
      SetParam(blockPath, SimulinkParameterName("ForegroundColor"), block.foregroundColor),
      SetParam(blockPath, SimulinkParameterName("Position"), block.rect),
      SetParam(blockPath, SimulinkParameterName("Orientation"), if (block.flip) "left" else "right")
    )
  }
}
