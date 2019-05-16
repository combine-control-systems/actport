package actport.model

/** Model representation of a block.
  *
  * @param id         block identifier
  * @param parent     block parent
  * @param name       block name
  * @param activateId Activate identifier
  * @param appearance block appearance
  * @param ports      port count
  * @param parameters dictionary of block parameters
  * @param sampleRate used to set an explicit sample rate of the block
  * @param context    initialization code used to set variable values in subsystem
  */
case class Block(id: BlockId,
                 parent: Option[BlockId],
                 name: BlockName,
                 activateId: ActivateId,
                 appearance: BlockAppearance,
                 ports: ActivatePortInfo,
                 parameters: BlockParameters = Map.empty,
                 sampleRate: Option[String] = None,
                 context: Option[String] = None,
                 mask: Map[MaskParameterName, MaskParameter] = Map.empty)
