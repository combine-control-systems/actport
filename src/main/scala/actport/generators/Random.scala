package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

object Random extends Generator[ActivateBlock] {
  override def apply(path: String)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"
    val randomPath = s"$blockPath/Random"

    val p = block.parameters.asScala

    val wrapper = Seq(
      // We need to wrap the random block in a subsystem to be able to trigger it externally.
      AddBlock("simulink/Ports & Subsystems/Subsystem", s"$blockPath"),
      DeleteLine(s"$blockPath", "In1/1", "Out1/1"),
      DeleteBlock(s"$blockPath/In1"),
      DeleteBlock(s"$blockPath/Out1"),
      AddBlock("simulink/Ports & Subsystems/Trigger", s"$blockPath/Trigger"),
      SetParam(s"$blockPath/Trigger", "TriggerType", "either"),
    )

    val commonContent = Seq(
      // Seed.
      // TODO: Activate generates different signals for a single seed while Simulink generates identical signals
      //       for one seed. Setting a vector of seeds gives different seeds to each signal.
      p.get("seed") match {
        case Some(seed: String) => SetParam(randomPath, "Seed", seed)
        case _ => SetParam(randomPath, "Seed", "0")
      },
      // Sample time.
      SetParam(randomPath, "SampleTime", "-1")
    )

    // We need to choose different Simulink blocks based on the random distribution.
    val content = p.get("distribution") match {

      case Some(d: String) if d == "'Normal'" =>
        Seq(
          AddBlock("simulink/Sources/Random Number", randomPath),
          AddBlock("simulink/Ports & Subsystems/Out1", s"$blockPath/Value"),
          AddLine(blockPath, "Random/1", "Value/1", SmartAutoRouting),
          // Mean value.
          p.get("A") match {
            case Some(mean: String) => SetParam(randomPath, "Mean", mean)
            case _ => SetParam(randomPath, "Mean", "0")
          },
          // Variance.
          p.get("B") match {
            case Some(variance: String) => SetParam(randomPath, "Variance", variance)
            case _ => SetParam(randomPath, "Variance", "1")
          }
        ) ++ commonContent

      case Some(d: String) if d == "'Uniform'" =>
        Seq(
          AddBlock("simulink/Sources/Uniform Random Number", randomPath),
          AddBlock("simulink/Ports & Subsystems/Out1", s"$blockPath/Value"),
          AddLine(blockPath, "Random/1", "Value/1", SmartAutoRouting),
          // Lower value.
          p.get("A") match {
            case Some(lower: String) => SetParam(randomPath, "Minimum", lower)
            case _ => SetParam(randomPath, "Minimum", "0")
          },
          // Range value.
          p.get("B") match {
            case Some(range: String) => SetParam(randomPath, "Maximum", range)
            case _ => SetParam(randomPath, "Maximum", "1")
          }
        ) ++ commonContent

      // If there is something else we just add an undefined block.
      case _ => Undefined(blockPath)
    }

    import scala.util.chaining._
    (wrapper ++ content ++ commonProperties(path)).tap(_.foreach(println))
  }
}
