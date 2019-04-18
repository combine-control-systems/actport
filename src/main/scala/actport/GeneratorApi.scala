package actport

import actport.simulink._

import scala.collection.JavaConverters._
import scala.util.chaining._

object GeneratorApi {
  def setBlockName(block: Block, name: String): Block = block match {
    case b: ActivateBlock => b.copy(name = name)
    case b: ActivateSuperBlock => b.copy(name = name)
  }

  def mapInputPort(block: Block, activatePort: Int, simulinkPort: String): Block = {
    val portMapping = (activatePort, ExplicitLink, InputPort) -> simulinkPort
    block.addPortMapping(Map(portMapping))
  }

  def mapEventInputPort(block: Block, activatePort: Int, simulinkPort: String): Block = {
    val portMapping = (activatePort, EventLink, InputPort) -> simulinkPort
    block.addPortMapping(Map(portMapping))
  }

  def mapOutputPort(block: Block, activatePort: Int, simulinkPort: String): Block = {
    val portMapping = (activatePort, ExplicitLink, OutputPort) -> simulinkPort
    block.addPortMapping(Map(portMapping))
  }

  def mapEventOutputPort(block: Block, activatePort: Int, simulinkPort: String): Block = {
    val portMapping = (activatePort, EventLink, OutputPort) -> simulinkPort
    block.addPortMapping(Map(portMapping))
  }

  def updateDiagram(diagram: Diagram, block: Block): Diagram =
    // The name of the block is expected to be updated in Matlab in add_block_2.
    diagram.copy(children = diagram.children :+ block)

  def addBlockExpr(block: Block, simulinkSource: SimulinkSource): Block = addBlockExpr(block, simulinkSource, null)

  def addBlockExpr(block: Block, simulinkSource: SimulinkSource, blockName: String = null): Block = {
    val name = Option(blockName) match {
      case Some(v) => v
      case None => block.name
    }
    block.addExpression(AddBlock(simulinkSource, SimulinkPath(name)))
  }

  def addAnnotationExpr(block: ActivateBlock, text: String): Block = {
    import ValueOps._
    block.copy(name = text.escapeAnnotation)
      .pipe(b => b.addExpression(AddAnnotation(SimulinkPath(b.name), b.rect)))
  }

  def addCleanSubSystemExpr(block: Block): Block = addCleanSubSystemExpr(block, null)

  def addCleanSubSystemExpr(block: Block, blockName: String): Block = {
    val name = Option(blockName) match {
      case Some(v) => v
      case None => block.name
    }
    block.addExpression(AddCleanSubsystem(SimulinkPath(name)))
  }

  def addCommonProperties(block: Block): Block = addCommonProperties(block, null)

  def addCommonProperties(block: Block, blockName: String): Block = {
    val name = Option(blockName) match {
      case Some(v) => v
      case None => block.name
    }
    val expr = Array(
      SetParam(SimulinkPath(name), SimulinkParameterName("BackgroundColor"), block.backgroundColor),
      SetParam(SimulinkPath(name), SimulinkParameterName("ForegroundColor"), block.foregroundColor),
      SetParam(SimulinkPath(name), SimulinkParameterName("Position"), block.rect),
      SetParam(SimulinkPath(name), SimulinkParameterName("Orientation"), if (block.flip) "left" else "right")
    )

    block match {
      case b: ActivateBlock => b.copy(expressions = b.expressions ++ expr)
      case b: ActivateSuperBlock => b.copy(expressions = b.expressions ++ expr)
    }
  }

  def getParameter(block: ActivateBlock, name: String, default: Any): Any = {
    val parts = name.split("/").toVector

    def getValue(parts: Vector[String], struct: ActivateStruct): Option[Any] = {
      val part = parts.headOption

      part.flatMap { value =>
        struct.asScala.get(value) match {
          case Some(next: ActivateStruct) => getValue(parts.tail, next)
          case Some(v) => Some(v)
          case _ => None
        }
      }
    }

    val value = getValue(parts, block.parameters)
    // Handle "Some(null) -> None".
    value.flatMap(Option.apply) match {
      case Some(v) => v
      case _ => default
    }
  }

  def setParamExpr(block: Block, parameterName: String, value: String): Block = {
    require(value != null, s"value must not be null for ${block.name} : $parameterName")
    block.addExpression(SetParam(SimulinkPath(block.name), SimulinkParameterName(parameterName), value))
  }

//  def setRawParamExpr(block: Block, parameterName: String, value: String): Block = {
//    require(value != null, s"Value must not be null for ${block.name} : $parameterName")
//    block.addExpressions(Seq(SetRawParam(SimulinkPath(block.name), SimulinkParameterName(parameterName), value)))
//  }
}
