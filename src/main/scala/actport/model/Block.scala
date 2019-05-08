package actport.model

/** Model representation of a block.
  *
  * @param id
  * @param parent
  * @param name
  * @param activateId
  * @param appearance
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
                 context: Option[String] = None)
