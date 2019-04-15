package actport

/** Size representation.
  *
  * @param width width
  * @param height height
  */
case class Size(width: Int = Configuration.minimumWidth,
                height: Int = Configuration.minimumHeight)
