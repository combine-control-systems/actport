package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

/** Continuous State-Space. */
object StateSpace extends Generator[ActivateBlock] {
  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala

    Seq(
      AddBlock(Simulink.Continuous.StateSpace, blockPath),
      p.get("A") match {
        case Some(a: String) => SetParam(blockPath, SimulinkParameterName("A"), a)
        case _ => SetParam(blockPath, SimulinkParameterName("A"), "1")
      },
      p.get("B") match {
        case Some(b: String) => SetParam(blockPath, SimulinkParameterName("B"), b)
        case _ => SetParam(blockPath, SimulinkParameterName("B"), "1")
      },
      p.get("C") match {
        case Some(c: String) => SetParam(blockPath, SimulinkParameterName("C"), c)
        case _ => SetParam(blockPath, SimulinkParameterName("C"), "1")
      },
      p.get("D") match {
        case Some(d: String) => SetParam(blockPath, SimulinkParameterName("D"), d)
        case _ => SetParam(blockPath, SimulinkParameterName("D"), "1")
      },
      p.get("x0") match {
        case Some(x0: String) => SetParam(blockPath, SimulinkParameterName("X0"), x0)
        case _ => SetParam(blockPath, SimulinkParameterName("X0"), "0")
      }
    ) ++ commonProperties(block, path)
  }
}
