package actport.generators

import actport.simulink._
import actport.{ActivateBlock, ActivateStruct}

import scala.collection.JavaConverters._

object Integral extends Generator[ActivateBlock] {
  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala

    val init = Seq(
      AddBlock(Simulink.Continuous.Integrator, blockPath),
      p.get("x0") match {
        case Some(x0: String) => SetParam(blockPath, SimulinkParameterName("InitialCondition"), x0)
        case _ => SetParam(blockPath, SimulinkParameterName("InitialCondition"), "0")
      },
      // TODO: Also set how the external signal re-initializes the integrator (see "ExternalReset").
      p.get("reinit") match {
        case Some(reinit: String) if reinit == "1" =>
          SetParam(blockPath, SimulinkParameterName("InitialConditionSource"), "external")
        case _ => SetParam(blockPath, SimulinkParameterName("InitialConditionSource"), "internal")
      },
      p.get("satur") match {
        case Some(saturation: String) if saturation == "1" =>
          SetParam(blockPath, SimulinkParameterName("LimitOutput"), "on")
        case _ => SetParam(blockPath, SimulinkParameterName("LimitOutput"), "off")
      },
    )

    val limits = p.get("limit") match {
      case Some(limit: ActivateStruct) =>
        Seq(
          SetParam(blockPath, SimulinkParameterName("UpperSaturationLimit"), limit.asScala.get("max") match {
            case Some(upperLimit: String) => upperLimit
            case _ => "inf"
          }),
          SetParam(blockPath, SimulinkParameterName("LowerSaturationLimit"), limit.asScala.get("min") match {
            case Some(lowerLimit: String) => lowerLimit
            case _ => "-inf"
          }),
          SetParam(blockPath, SimulinkParameterName("ZeroCross"), limit.asScala.get("zcross") match {
            case Some(zcross: String) => zcross
            case _ => "off"  // Default in Activate, but default "on" in Simulink.
          })
        )
      case _ => Seq()
    }

    init ++ limits ++ commonProperties(path)
  }
}
