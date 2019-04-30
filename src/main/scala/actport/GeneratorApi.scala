package actport

import actport.simulink._
import monocle.macros.syntax.lens._

import scala.collection.JavaConverters._
import scala.util.chaining._

object GeneratorApi {
  /** Set the name of the block.
    *
    * @param block block object
    * @param name  name of the block
    * @return block with name
    */
  def setBlockName(block: Entity, name: String): Entity = block match {
    // TODO: Maybe move to an internal API since add_block_2 is the only function to call this.
    case b: Block => b.lens(_.name).set(name)
    case b: System => b.lens(_.name).set(name)
  }

  /** Map Activate input port to an equivalent Simulink port.
    *
    * @param block        block object
    * @param activatePort Activate port index
    * @param simulinkPort name of Simulink port
    * @return updated block object
    */
  def mapInputPort(block: Entity, activatePort: Int, simulinkPort: String): Entity = {
    val portMapping = (activatePort, ExplicitLink, InputPort) -> simulinkPort
    block.addPortMapping(Map(portMapping))
  }

  /** Map Activate event input port to an equivalent Simulink port.
    *
    * @param block        block object
    * @param activatePort Activate port index
    * @param simulinkPort name of Simulink port
    * @return updated block object
    */
  def mapEventInputPort(block: Entity, activatePort: Int, simulinkPort: String): Entity = {
    val portMapping = (activatePort, EventLink, InputPort) -> simulinkPort
    block.addPortMapping(Map(portMapping))
  }

  /** Map Activate output port to an equivalent Simulink port.
    *
    * @param block        block object
    * @param activatePort Activate port index
    * @param simulinkPort name of Simulink port
    * @return updated block object
    */
  def mapOutputPort(block: Entity, activatePort: Int, simulinkPort: String): Entity = {
    val portMapping = (activatePort, ExplicitLink, OutputPort) -> simulinkPort
    block.addPortMapping(Map(portMapping))
  }

  /** Map Activate event output port to an equivalent Simulink port.
    *
    * @param block        block object
    * @param activatePort Activate port index
    * @param simulinkPort name of Simulink port
    * @return updated block object
    */
  def mapEventOutputPort(block: Entity, activatePort: Int, simulinkPort: String): Entity = {
    val portMapping = (activatePort, EventLink, OutputPort) -> simulinkPort
    block.addPortMapping(Map(portMapping))
  }

  /** Update system by adding the block as a child.
    *
    * @param system [[System]] object
    * @param block  [[Entity]] to add.
    * @return updated [[System]] object.
    */
  def updateSystem(system: System, block: Entity): System = {
    // The name of the block is expected to be updated in Matlab in add_block_2.
    system.lens(_.children).modify(_ :+ block)
  }

  /** Create expression for add_block.
    *
    * @param block          block object
    * @param simulinkSource source of Simulink block, e.g. `simulink.Continuous.Derivate`
    * @return expression
    */
  def addBlockExpr(block: Entity, simulinkSource: SimSource): Entity = addBlockExpr(block, simulinkSource, null)

  /** Create expression for add_block with a block name.
    *
    * The blockName can be used to point at child blocks if creating a subsystem with
    * several blocks to describe the functionality of an Activate block.
    * The block name should then be something like
    * {{{
    * s"${block.name}/name of child block"
    * }}}
    * in Scala and
    * {{{
    * sprintf('%s/name of child block', block.name);
    * }}}
    * in Matlab.
    *
    * @param block          block object
    * @param simulinkSource source of Simulink block, e.g. `simulink.Continuous.Derivate`
    * @param blockName      name of block to add
    * @return updated block with expressions
    */
  def addBlockExpr(block: Entity, simulinkSource: SimSource, blockName: String = null): Entity = {
    val name = Option(blockName) match {
      case Some(v) => v
      case None => block.name
    }
    block.addExpression(AddBlock(simulinkSource, SimPath(name)))
  }

  /** Create expression for Annotation blocks.
    *
    * @param block block object
    * @param text  annotation text
    * @return expression
    */
  def addAnnotationExpr(block: Block, text: String): Entity = {
    import ValueOps._
    block.copy(name = text.escapeAnnotation)
      .pipe(b => b.addExpression(AddAnnotation(SimPath(b.name), b.rect)))
  }

  /** Create expressions for a clean subsystem without any content.
    *
    * Just adding a subsystem also adds one input port, one output port
    * and a link connecting the ports.
    *
    * @param block block object
    * @return updated block with expressions
    */
  def addCleanSubSystemExpr(block: Entity): Entity = addCleanSubSystemExpr(block, null)

  /** Create expressions for a clean subsystem without any content.
    *
    * Just adding a subsystem also adds one input port, one output port
    * and a link connecting the ports.
    *
    * @see [[addBlockExpr]] for examples of how to use blockName.
    * @param block     block object
    * @param blockName name of block to add
    * @return updated block with expressions
    */
  def addCleanSubSystemExpr(block: Entity, blockName: String): Entity = {
    val name = Option(blockName) match {
      case Some(v) => v
      case None => block.name
    }
    block.addExpression(AddCleanSubsystem(SimPath(name)))
  }

  /** Add common property expressions to the block.
    *
    * @param block block object
    * @return updated block with expressions
    */
  def addCommonProperties(block: Entity): Entity = addCommonProperties(block, null)

  /** Add common property expressions to the block.
    *
    * @see [[addBlockExpr]] for examples of how to use blockName.
    * @param block     block object
    * @param blockName block name
    * @return updated block with expressions
    */
  def addCommonProperties(block: Entity, blockName: String): Entity = {
    val name = Option(blockName) match {
      case Some(v) => v
      case None => block.name
    }
    val expr = Array(
      SetParam(SimPath(name), Vector((SimParName("BackgroundColor"), block.backgroundColor))),
      SetParam(SimPath(name), Vector((SimParName("ForegroundColor"), block.foregroundColor))),
      SetParam(SimPath(name), Vector((SimParName("Position"), block.rect))),
      SetParam(SimPath(name), Vector((SimParName("Orientation"), if (block.flip) "left" else "right")))
    )

    block match {
      case b: Block => b.lens(_.expressions).modify(_ ++ expr)
      case b: System => b.lens(_.expressions).modify(_ ++ expr)
    }
  }

  /** Get parameter from block.
    *
    * The name of the parameter can be a path through the Matlab struct
    * (which has been converted to an [[ActivateStruct]]). Example in Matlab:
    * {{{
    * getParameter(block, 'this/is/a/path/to/a/parameter', '0');
    * }}}
    *
    * @param block   block object
    * @param name    name of parameter
    * @param default default value if parameter is not found
    * @return parameter value
    */
  def getParameter(block: Block, name: String, default: Any): Any = {
    val parts = name.split("/").toVector

    // Search structure recursively until we find a value or not.
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
    // Handle the case where Some(null) should be None.
    value.flatMap(Option.apply) match {
      // We have a value.
      case Some(v) => v
      // Nothing. Return default value.
      case _ => default
    }
  }

  /** Create expression to set block parameter with a block name.
    *
    * @see [[addBlockExpr]] for examples of how to use blockName.
    * @param block         block object
    * @param blockName     block name
    * @param parameterName name of parameter
    * @param value         value to set
    * @return update block with expression
    */
  def setParamExpr(block: Entity, blockName: String, parameterName: String, value: String): Entity = {
    require(value != null, s"value must not be null for ${block.name} : $parameterName")
    block.addExpression(SetParam(SimPath(blockName), Vector((SimParName(parameterName), value))))
  }

  /** Create expression to set block parameter.
    *
    * @param block         block object
    * @param parameterName name of parameter
    * @param value         value to set
    * @return update block with expression
    */
  def setParamExpr(block: Entity, parameterName: String, value: String): Entity = {
    require(value != null, s"value must not be null for ${block.name} : $parameterName")
    block.addExpression(SetParam(SimPath(block.name), Vector((SimParName(parameterName), value))))
  }

  /** Create expression to set multiple block parameters at the same time.
    *
    * This is required to be able to set the parameters for e.g. simulink/Signal Routing/Selector
    *
    * Calling this from Matlab would be something like:
    * {{{
    *   setParamExpr(block, 'par1', 'val1', 'par2', 'val2');
    * }}}
    *
    * @param block          block object
    * @param namesAndValues parameter names and values
    * @param quoted         values must be explicitly quoted
    * @return updated block with expression
    */
  def setParamExpr(block: Entity, namesAndValues: Array[String], quoted: Boolean = true): Entity = {
    require(namesAndValues.length % 2 == 0, "There must be an even number of names and values, otherwise they will " +
      "not be complete pairs.")
    val pairs = namesAndValues.grouped(2).map(v => (SimParName(v.head), v(1))).toVector
    block.addExpression(SetParam(SimPath(block.name), pairs, quoted))
  }

  /** Create expression to add a line in a block.
    *
    * This function is used when wrapping several blocks in a subsystem
    * and those needs to be connected. The expression is never exposed
    * to port mapping since there are no Activate ports involved when
    * creating an expression directly.
    *
    * @param block           block object
    * @param system          system to add line to, usually `block.name`
    * @param startPort       Simulink syntax `block name/port number`, e.g. `Random/1`
    * @param destinationPort Simlunk syntax `block name/port number`, e.g. `Random/1`
    * @return updated block with expression
    */
  def addLineExpr(block: Entity, system: String, startPort: String, destinationPort: String): Entity = {
    block.addExpression(AddLine(SimPath(system), SimPort(startPort),
      SimPort(destinationPort), SmartAutoRouting))
  }
}
