package actport.generators

import actport.ActivateBlock
import actport.simulink._
import fastparse.Parsed.Success
import sun.reflect.generics.reflectiveObjects.NotImplementedException

import scala.collection.JavaConverters._

object SampleClock extends Generator[ActivateBlock] {
  object Parser {
    import fastparse._
    import SingleLineWhitespace._

    sealed trait SampleClockState
    case object AlwaysActive extends SampleClockState
    case object ActivatedAtInitialTime extends SampleClockState
    case class SamplePeriod(frequency: Double) extends SampleClockState
    case class Expression(frequency: String) extends SampleClockState

    def frequency[_: P]: P[SampleClockState] =
      P(activatedAtInitialTime | alwaysActive | expression | vectorPeriod | samplePeriod)
    def activatedAtInitialTime[_: P]: P[SampleClockState] = P("-1").map(_ => ActivatedAtInitialTime)
    def alwaysActive[_: P]: P[SampleClockState] = P("0" | "0.0").map(_ => AlwaysActive)
    def expression[_: P]: P[SampleClockState] = P(CharIn("a-zA-Z") ~ AnyChar.rep).!.map(Expression)
    def vectorPeriod[_: P]: P[SampleClockState] = vector.map(SamplePeriod)
    def samplePeriod[_: P]: P[SampleClockState] = number.map(SamplePeriod)

    def offset[_: P]: P[String] = P(offsetExpression | offsetVector | offsetScalar)
    def offsetExpression[_: P]: P[String] = P(CharIn("a-zA-Z") ~ AnyChar.rep).!
    def offsetVector[_: P]: P[String] = vector.map(_.toString)
    def offsetScalar[_: P]: P[String] = number.map(_.toString)

    def number[_: P]: P[Double] = P("-".? ~ digit.rep(1) ~ ("." ~ digit.rep(1)).rep ~
      (("e" | "E") ~ "-".? ~ digit.rep(1)).?).!.map(_.toDouble)
    def digit[_: P]: P[Unit] = P(CharIn("0-9"))
    def vector[_: P]: P[Double] = P("[" ~ number ~ ";" ~ number ~ ";" ~ number ~ "]").map {
      // According to Activate documentation for SampleClock.
      case (x, y, z) => (x / y) * Math.pow(10.0, z)
    }
  }

  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    import fastparse.parse

    val blockPath = path / block.name

    val p = block.parameters.asScala

    val frequency = p.get("frequ") match {
      case Some(f: String) =>
        parse(f, Parser.frequency(_)) match {
          case Success(value, _) => value
          // Return string as-is if the parser fails.
          case _ => Parser.Expression(f)
        }
      // Default value.
      case _ => Parser.SamplePeriod(1.0)
    }

    val offset = p.get("offset") match {
      case Some(o: String) =>
        parse(o, Parser.offset(_)) match {
          case Success(value, _) => value
          // Return string as-is if the parser fails.
          case _ => o
        }
      // Default value.
      case _ => "0"
    }

    (frequency match {
      case Parser.ActivatedAtInitialTime =>
        Seq(
          AddBlock(Simulink.Sources.Step, blockPath),
          SetParam(blockPath, SimulinkParameterName("Time"), offset)
        )
      // TODO: Not sure how to handle this case.
      case Parser.AlwaysActive => throw new NotImplementedException()
      case Parser.Expression(expr) =>
        Seq(
          AddBlock(Simulink.Sources.CounterLimited, blockPath),
          SetParam(blockPath, SimulinkParameterName("uplimit"), 1),
          SetParam(blockPath, SimulinkParameterName("tsamp"), expr)
        )
      case Parser.SamplePeriod(ts) =>
        Seq(
          AddBlock(Simulink.Sources.CounterLimited, blockPath),
          SetParam(blockPath, SimulinkParameterName("uplimit"), 1),
          SetParam(blockPath, SimulinkParameterName("tsamp"), ts)
        )
    }) ++ commonProperties(path)
  }
}
