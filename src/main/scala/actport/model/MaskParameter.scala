package actport.model

import actport.oml.ActivateStruct

import scala.collection.JavaConverters._

/** Model representation of a Mask Parameter.
  *
  * @param name           name of parameter
  * @param rank           value rank
  * @param value          value
  * @param prompt         parameter label
  * @param evaluate       parameter should be evaluated
  * @param enable         parameter should be enabled or not
  * @param visible        parameter should be visible or not
  * @param parameterStyle parameter style information
  * @param callback       parameter callback information
  * @param tabName        parameter tab page name
  * @param toolTip        parameter tooltip text
  * @param buttonImage    parameter button image
  * @param buttonText     parameter button text
  * @param buttonToolTip  parameter button tooltip text
  * @param parameterType  parameter data type
  * @param dimensions     parameter matrix dimensions
  * @param unit           parameter unit
  */
case class MaskParameter(name: String,
                         rank: Int,
                         value: String,
                         prompt: String,
                         evaluate: Boolean,
                         enable: Boolean,
                         visible: Boolean,
                         parameterStyle: Vector[Any],
                         callback: String,
                         tabName: String,
                         toolTip: String,
                         buttonImage: String,
                         buttonText: String,
                         buttonToolTip: String,
                         parameterType: String,
                         dimensions: String,
                         unit: String)

object MaskParameter {
  /** Create a mask parameter object from a dictionary of properties.
    *
    * @param name name of parameter
    * @param mask dictionary of parameters
    * @throws NoSuchElementException if the mask field is missing
    * @return mask parameter data
    */
  @throws[NoSuchFieldException]("if mask field is missing")
  def apply(name: String, mask: Map[String, Any]): MaskParameter = {
    mask.get(name) match {
      case Some(x: ActivateStruct) =>
        val p = x.asScala.toMap
        MaskParameter(
          name = name,
          rank = p.get("rank") match {
            case Some(rank: Double) => rank.toInt
            case _ => throw error(name, "rank")
          },
          value = p.get("value") match {
            case Some(value) => value.toString
            case _ => throw error(name, "value")
          },
          prompt = p.get("prompt") match {
            case Some(prompt: String) => prompt
            case _ => throw error(name, "prompt")
          },
          evaluate = p.get("evaluate") match {
            case Some(evaluate: Double) => evaluate.toInt == 1
            case _ => throw error(name, "evaluate")
          },
          enable = p.get("enable") match {
            case Some(enable: Double) => enable.toInt == 1
            case _ => throw error(name, "enable")
          },
          visible = p.get("visible") match {
            case Some(visible: Double) => visible.toInt == 1
            case _ => throw error(name, "visible")
          },
          parameterStyle = p.get("parameter_style") match {
            case Some(ps: Array[Any]) => ps.toVector
            case _ => throw error(name, "parameter_style")
          },
          callback = p.get("callback") match {
            case Some(callback: String) => callback
            case _ => throw error(name, "callback")
          },
          tabName = p.get("tabname") match {
            case Some(tabName: String) => tabName
            case _ => throw error(name, "tabname")
          },
          toolTip = p.get("tooltip") match {
            case Some(toolTip: String) => toolTip
            case _ => throw error(name, "tooltip")
          },
          buttonImage = p.get("buttonimage") match {
            case Some(buttonImage: String) => buttonImage
            case _ => throw error(name, "buttonimage")
          },
          buttonText = p.get("buttontext") match {
            case Some(buttonText: String) => buttonText
            case _ => throw error(name, "buttontext")
          },
          buttonToolTip = p.get("buttontooltip") match {
            case Some(buttonToolTip: String) => buttonToolTip
            case _ => throw error(name, "buttontooltip")
          },
          parameterType = p.get("type") match {
            case Some(parameterName: String) => parameterName
            case _ => throw error(name, "type")
          },
          dimensions = p.get("dimensions") match {
            case Some(dimension: String) => dimension
            case v => throw error(name, "dimensions")
          },
          unit = p.get("unit") match {
            case Some(unit: String) => unit
            case _ => throw error(name, "unit")
          })
      case _ => throw new NoSuchFieldException(s"no mask parameter with name $name found")
    }
  }

  /** Common error reporting function.
    *
    * @param name  parameter name
    * @param field field name
    * @return exception to throw
    */
  private def error(name: String, field: String): NoSuchFieldException =
    new NoSuchFieldException(s"$field field missing for mask parameter $name")
}
