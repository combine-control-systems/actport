package actport.generators
import actport.ActivateSuperBlock
import actport.simulink._

object SuperBlock extends Generator[ActivateSuperBlock] {
  override def apply(path: SimulinkPath)(implicit block: ActivateSuperBlock): Seq[Expression] = {
    val blockPath = path / block.name

    val eventPort = if (block.eventInputCount == 1) {
      Seq(AddBlock(Simulink.PortsAndSubsystems.Trigger, blockPath / "Trigger"))
    } else Seq.empty[Expression]

    Seq(
      AddBlock(Simulink.PortsAndSubsystems.Subsystem, blockPath),

      // Remove default ports.
      DeleteLine(blockPath, SimulinkPort("In1/1"), SimulinkPort("Out1/1")),
      DeleteBlock(blockPath / "In1"),
      DeleteBlock(blockPath / "Out1"),

    ) ++ block.diagram.map(_.toExpression(blockPath)).getOrElse(Seq.empty) ++ eventPort ++ commonProperties(path)
  }
}
