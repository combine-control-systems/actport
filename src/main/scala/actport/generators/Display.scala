package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

/** Display signal. */
object Display extends Generator[ActivateBlock] {
  /** Generates a sequence of expressions to create a Simulink representation.
    *
    * @param path  location of block
    * @param block block instance
    * @return sequence of expressions
    */
  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala

    Seq(
      AddBlock(Simulink.Sinks.Display, blockPath),
      p.get("fmt") match {
        case Some(_: String) =>
          // TODO: Parse format string and translate to closest Simulink equivalent among the values
          //       'short' | 'long' | 'short_e' | 'long_e' | 'bank' | 'hex (Stored Integer)' |
          //       'binary (Stored Integer)' | 'decimal (Stored Integer)' | 'octal (Stored Integer)'
          SetParam(blockPath, SimulinkParameterName("Format"), "short")
        case _ =>
          SetParam(blockPath, SimulinkParameterName("Format"), "short")
      },
      p.get("dt") match {
        case Some(dt: String) =>
          // TODO: "dt" (Activate) and "decimation" (Simulink) are not equivalent. "dt" is given in seconds
          //       and "decimation" is given as every n:th sample.
          SetParam(blockPath, SimulinkParameterName("Decimation"), Math.max(1, dt.toDouble.floor.toInt))
        case _ =>
          SetParam(blockPath, SimulinkParameterName("Decimation"), 1)
      }
      // TODO: externalActivation and showatend are not handled.
    ) ++ commonProperties(path)
  }
}
