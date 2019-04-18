package actport.generators

import actport.ActivateBlock
import actport.simulink.{BuiltIn, Expression, SimulinkPath}

import scala.collection.JavaConverters._

/** Annotation text area. */
object Annotation extends Generator[ActivateBlock] {
  import actport.simulink.ValueOps._

  override def generateExpressions(block: ActivateBlock, path: SimulinkPath): Seq[Expression] = {
    val p = block.parameters.asScala
    val text = p.get("txt") match {
      case Some(text: String) => text.escapeAnnotation
      case _ => "['No text...']"
    }
    val blockPath = SimulinkPath(s"['$path/', $text]")

    val v = block.rect

    Seq(
      // We have to use a raw expression since this is quite special.
      RawExpression(s"add_block('${BuiltIn.Area}', $blockPath, 'Position', " +
        // TODO: This expression is duplicated from expression.scala#SetParam[A]#serialize.
        s"[${v.x},${-v.y - v.height},${v.x + v.width},${-v.y}]);")
    )
  }
}
