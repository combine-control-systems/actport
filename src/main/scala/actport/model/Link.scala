package actport.model

/** Model representation of a Link.
  *
  * @param id       link identifier
  * @param parent   parent block
  * @param linkType type of link
  * @param start    start block and port
  * @param end      end block and port
  */
case class Link(id: LinkId,
                parent: BlockId,
                linkType: LinkType,
                start: LinkStart,
                end: LinkEnd)
