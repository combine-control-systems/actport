package actport.model

case class Link(id: LinkId,
                parent: BlockId,
                linkType: LinkType,
                start: LinkStart,
                end: LinkEnd)
