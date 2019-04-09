package actport.generators
import actport.ActivateSuperBlock
import actport.simulink._

object SuperBlock extends Generator[ActivateSuperBlock] {
  override def apply(path: String)(implicit block: ActivateSuperBlock): Seq[Expression] = {
    val blockPath = s"$path/${block.name}"

    val eventPort = if (block.eventInputCount == 1) {
      Seq(AddBlock("simulink/Ports & Subsystems/Trigger", s"$blockPath/Trigger"))
    } else Seq.empty[Expression]

    Seq(
      AddBlock("simulink/Ports & Subsystems/Subsystem", blockPath),

      // Remove default ports.
      DeleteLine(blockPath, "In1/1", "Out1/1"),
      DeleteBlock(s"$blockPath/In1"),
      DeleteBlock(s"$blockPath/Out1"),

    ) ++ block.diagram.map(_.toExpression(blockPath)).getOrElse(Seq.empty) ++ eventPort ++ commonProperties(path)
  }
}
