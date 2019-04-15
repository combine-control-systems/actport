package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

/** Discrete unit-delay. */
object DiscreteDelay extends Generator[ActivateBlock] {
  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala

    // TODO: Handle datatype.
    Seq(
      AddBlock(Simulink.Discrete.UnitDelay, blockPath),
      SetParam(blockPath, SimulinkParameterName("InitialCondition"), p.get("init_cond") match {
        case Some(initialCondition: String) => initialCondition
        case _ => "0"
      })
    ) ++ commonProperties(path)
  }
}
