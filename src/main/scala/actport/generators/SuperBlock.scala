package actport.generators
import actport.ActivateSuperBlock
import actport.simulink._

object SuperBlock extends Generator[ActivateSuperBlock] {
  override def apply(path: String)(implicit block: ActivateSuperBlock): Seq[String] = {
    val blockPath = s"$path/${block.name}"

    val eventPort = if (block.eventInputCount == 1) {
      Seq(addBlock("simulink/Ports & Subsystems/Trigger", s"$blockPath/Trigger"))
    } else Seq.empty[String]

    Seq(
      addBlock("simulink/Ports & Subsystems/Subsystem", blockPath),

      // Remove default ports.
      deleteLine(blockPath, "In1/1", "Out1/1"),
      deleteBlock(s"$blockPath/In1"),
      deleteBlock(s"$blockPath/Out1"),

    ) ++ block.diagram.map(_.toMatlab(blockPath)).getOrElse(Seq.empty) ++ eventPort ++ commonProperties(path)
  }
}
