package actport

import actport.simulink._

import scala.util.chaining._
import scala.collection.JavaConverters._

object GeneratorApi {
  def test(s: String*): String = s.mkString("-")

  def addExpression(block: Block, expression: Expression): Block = block.addExpressions(Seq(expression))
  def addExpressions(block: Block, expressions: Array[Expression]): Block = block.addExpressions(expressions)

  def addPortMap(block: Block, portMap: (PortKey, String)): Block = block.addPortMappings(Seq(portMap).toMap)
  def addPortMaps(block: Block, portMaps: Array[(PortKey, String)]): Block = block.addPortMappings(portMaps.toMap)

  def inputPort(activatePort: Int, simulinkPort: String): (PortKey, String) =
    (activatePort, ExplicitLink, InputPort) -> simulinkPort

  def eventInputPort(activatePort: Int, simulinkPort: String): (PortKey, String) =
    (activatePort, EventLink, InputPort) -> simulinkPort

  def outputPort(activatePort: Int, simulinkPort: String): (PortKey, String) =
    (activatePort, ExplicitLink, OutputPort) -> simulinkPort

  def eventOutputPort(activatePort: Int, simulinkPort: String): (PortKey, String) =
    (activatePort, EventLink, OutputPort) -> simulinkPort

  def updateDiagram(diagram: Diagram, block: Block, blockName: String): Diagram =
    (block match {
      case b: ActivateBlock => b.copy(name = blockName)
      case b: ActivateSuperBlock => b.copy(name = blockName)
    }).pipe(b => diagram.copy(children = diagram.children :+ b))

  def addBlock(simulinkSource: SimulinkSource, blockName: String): Expression =
    AddBlock(simulinkSource, SimulinkPath(blockName))

  def addCleanSubSystem(blockName: String): Expression = AddCleanSubsystem(SimulinkPath(blockName))

  def addCommonProperties(block: Block, name: String): Block = {
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

  def getParameter(block: ActivateBlock, name: String, default: String): String = {
    val p = block.parameters.asScala

    p.get(name) match {
      case Some(value: String) => value
      case _ => default
    }
  }

  def setParam (blockName: String, name: String, value: String): Expression = {
    SetParam(SimulinkPath(blockName), SimulinkParameterName(name), value)
  }
}
