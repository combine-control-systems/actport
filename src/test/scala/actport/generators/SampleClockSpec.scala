package actport.generators

import fastparse.Parsed.Success
import fastparse.parse
import org.scalacheck.Gen
import org.scalatest._
import org.scalatest.prop.GeneratorDrivenPropertyChecks

class SampleClockSpec extends FlatSpec with Matchers with GeneratorDrivenPropertyChecks {
  "SampleClock frequency parser" should "parse '0' as AlwaysActive" in {

    parse("0", SampleClock.Parser.frequency(_)) shouldBe
      Success(SampleClock.Parser.AlwaysActive, 1)
  }

  it should "parse '0.0' as AlwaysActive" in {
    parse("0.0", SampleClock.Parser.frequency(_)) shouldBe
      Success(SampleClock.Parser.AlwaysActive, 1)
  }

  it should "parse something starting with a letter as an expression" in {
    forAll(Gen.alphaChar, Gen.asciiStr) { (c: Char, s: String) =>
      val expr = s"$c$s"
      parse(expr, SampleClock.Parser.frequency(_)) match {
        case Success(SampleClock.Parser.Expression(e), _) => e shouldBe expr
        case _ => fail
      }
    }
  }

  it should "parse a vector according to a formula" in {
    forAll { (x: Double, y: Double, z: Double) =>
      // Avoid division by zero and limit magnitude.
      whenever(Math.abs(y) > 0.0 && Math.abs(z) < 50.0) {
        val expr = s"[$x;$y;$z]"
        val value = (x / y) * Math.pow(10.0, z)
        parse(expr, SampleClock.Parser.frequency(_)) match {
          case Success(SampleClock.Parser.SamplePeriod(v), _) => v shouldBe value
          case _ => fail
        }
      }
    }
  }

  it should "parse '-1' as ActivatedAtInitialTime" in {
    val expr = "-1"
    parse(expr, SampleClock.Parser.frequency(_)) match {
      case Success(v, _) => v shouldBe SampleClock.Parser.ActivatedAtInitialTime
      case _ => fail
    }
  }

  it should "parse a number as a sample period" in {
    forAll { x: Double =>
      whenever(x > 0.0) {
        val expr = x.toString
        parse(expr, SampleClock.Parser.frequency(_)) match {
          case Success(SampleClock.Parser.SamplePeriod(v), _) => v shouldBe x
          case _ => fail
        }
      }
    }
  }

  "SampleClock offset parser" should "parse something starting with a letter as an expression" in {
    forAll(Gen.alphaChar, Gen.asciiStr) { (c: Char, s: String) =>
      val expr = s"$c$s"
      parse(expr, SampleClock.Parser.offset(_)) match {
        case Success(offset, _) => offset shouldBe expr
        case _ => fail
      }
    }
  }

  it should "parse a vector according to a formula" in {
    forAll { (x: Double, y: Double, z: Double) =>
      // Avoid division by zero and limit magnitude.
      whenever(Math.abs(y) > 0.0 && Math.abs(z) < 10.0) {
        val expr = s"[$x;$y;$z]"
        val value = (x / y) * Math.pow(10.0, z)
        parse(expr, SampleClock.Parser.offset(_)) match {
          case Success(offset, _) => offset shouldBe value.toString
          case _ => fail
        }
      }
    }
  }

  it should "parse a scalar as an offset" in {
    forAll { x: Double =>
      val expr = x.toString
      parse(expr, SampleClock.Parser.offset(_)) match {
        case Success(offset, _) => offset shouldBe expr
        case _ => fail
      }
    }
  }
}
