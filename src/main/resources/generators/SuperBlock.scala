package actport.generators
import actport.ActivateSuperBlock
import actport.simulink._

/** Activate Super Block. */
object SuperBlock extends Generator[ActivateSuperBlock] {
  override def generateExpressions(block: ActivateSuperBlock, path: SimulinkPath): Seq[Expression] = {
    val blockPath = path / block.name

    val eventPort = if (block.eventInputCount == 1) {
      Seq(AddBlock(Simulink.PortsAndSubsystems.Trigger, blockPath / "Trigger"))
    } else Seq.empty[Expression]

    Seq(AddCleanSubsystem(blockPath)) ++ block.diagram.map(_.toExpression(blockPath)).getOrElse(Seq.empty) ++
      eventPort ++ commonProperties(block, path) :+ ArrangeSystem(blockPath)
  }
}
