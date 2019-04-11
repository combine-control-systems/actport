package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

object Random extends Generator[ActivateBlock] {
  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = path / block.name
    val randomPath = blockPath / "Random"

    val p = block.parameters.asScala

    val wrapper = Seq(
      // We need to wrap the random block in a subsystem to be able to trigger it externally.
      AddBlock(Simulink.PortsAndSubsystems.Subsystem, blockPath),
      DeleteLine(blockPath, SimulinkPort("In1/1"), SimulinkPort("Out1/1")),
      DeleteBlock(blockPath / "In1"),
      DeleteBlock(blockPath / "Out1"),
      AddBlock(Simulink.PortsAndSubsystems.Trigger, blockPath / "Trigger"),
      SetParam(blockPath / "Trigger", SimulinkParameterName("TriggerType"), "either"),
    )

    val commonContent = Seq(
      // Seed.
      // TODO: Activate generates different signals for a single seed while Simulink generates identical signals
      //       for one seed. Setting a vector of seeds gives different seeds to each signal.
      p.get("seed") match {
        case Some(seed: String) => SetParam(randomPath, SimulinkParameterName("Seed"), seed)
        case _ => SetParam(randomPath, SimulinkParameterName("Seed"), "0")
      },
      // Sample time.
      SetParam(randomPath, SimulinkParameterName("SampleTime"), "-1")
    )

    // We need to choose different Simulink blocks based on the random distribution.
    val content = p.get("distribution") match {

      case Some(d: String) if d == "'Normal'" =>
        Seq(
          AddBlock(Simulink.Sources.RandomNumber, randomPath),
          AddBlock(Simulink.PortsAndSubsystems.Out1, blockPath / "Value"),
          AddLine(blockPath, SimulinkPort("Random/1"), SimulinkPort("Value/1"), SmartAutoRouting),
          // Mean value.
          p.get("A") match {
            case Some(mean: String) => SetParam(randomPath, SimulinkParameterName("Mean"), mean)
            case _ => SetParam(randomPath, SimulinkParameterName("Mean"), "0")
          },
          // Variance.
          p.get("B") match {
            case Some(variance: String) => SetParam(randomPath, SimulinkParameterName("Variance"), variance)
            case _ => SetParam(randomPath, SimulinkParameterName("Variance"), "1")
          }
        ) ++ commonContent

      case Some(d: String) if d == "'Uniform'" =>
        Seq(
          AddBlock(Simulink.Sources.UniformRandomNumber, randomPath),
          AddBlock(Simulink.PortsAndSubsystems.Out1, blockPath / "Value"),
          AddLine(blockPath, SimulinkPort("Random/1"), SimulinkPort("Value/1"), SmartAutoRouting),
          // Lower value.
          p.get("A") match {
            case Some(lower: String) => SetParam(randomPath, SimulinkParameterName("Minimum"), lower)
            case _ => SetParam(randomPath, SimulinkParameterName("Minimum"), "0")
          },
          // Range value.
          p.get("B") match {
            case Some(range: String) => SetParam(randomPath, SimulinkParameterName("Maximum"), range)
            case _ => SetParam(randomPath, SimulinkParameterName("Maximum"), "1")
          }
        ) ++ commonContent

      // If there is something else we just add an undefined block.
      case _ => Undefined(blockPath)
    }

    wrapper ++ content ++ commonProperties(path)
  }
}
