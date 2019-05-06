package actport.model

case class Block(id: BlockId,
                 parent: Option[BlockId],
                 name: BlockName,
                 activateId: ActivateId,
                 appearance: BlockAppearance,
                 ports: ActivatePortInfo,
                 parameters: BlockParameters = Map.empty)
