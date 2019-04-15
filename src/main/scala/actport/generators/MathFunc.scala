package actport.generators

import actport.ActivateBlock
import actport.simulink._

import scala.collection.JavaConverters._

/** Block for selecting various mathematical functions. */
object MathFunc extends Generator[ActivateBlock] {
  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala

    val func = p.get("func")

    (func match {

      case Some("'exp'") => mathFunc(blockPath, "exp")
      case Some("'log'") => mathFunc(blockPath, "log")
      case Some("'10^u'") => mathFunc(blockPath, "10^u")
      case Some("'log10'") => mathFunc(blockPath, "log10")
      case Some("'|u|'") => Seq(AddBlock(Simulink.MathOperations.Abs, blockPath))
      case Some("'u^2'") => mathFunc(blockPath, "square")
      case Some("'sqrt'") => Seq(AddBlock(Simulink.MathOperations.Sqrt, blockPath))
      case Some("'1/u'") => mathFunc(blockPath, "reciprocal")
      case Some("'conj'") => mathFunc(blockPath, "conj")
      case Some("'|u|^2'") => mathFunc(blockPath, "magnitude^2")
      // There is no log2 available, so we calculate using log(x)/log(2).
      case Some("'log2'") => Seq(
        AddBlock(Simulink.UserDefinedFunctions.MatlabFunction, blockPath),
        SetMatlabFunctionScript(blockPath, MatlabScript(
          """function y = f(x)
            |%#codegen
            |y = log(x)/log(2);
            |end
          """.stripMargin)
        )
      )
      // There is no erf in Simulink and we have to resort to Matlab.
      case Some("'erf'") => Seq(
        AddBlock(Simulink.UserDefinedFunctions.MatlabFunction, blockPath),
        SetMatlabFunctionScript(blockPath, MatlabScript(
          """function y = f(x)
            |%#codegen
            |y = erf(x);
            |end
          """.stripMargin))
      )
      // There is no erfc in Simulink and we have to resort to Matlab.
      case Some("'erfc'") => Seq(
        AddBlock(Simulink.UserDefinedFunctions.MatlabFunction, blockPath),
        SetMatlabFunctionScript(blockPath, MatlabScript(
          """function y = f(x)
            |%#codegen
            |y = erfc(x);
            |end
          """.stripMargin))
      )
      case Some("'2^u'") => Seq(
        AddBlock(Simulink.UserDefinedFunctions.MatlabFunction, blockPath),
        SetMatlabFunctionScript(blockPath, MatlabScript(
        """function y = f(x)
          |%#codegen
          |y = 2.^x;
          |end
        """.stripMargin))
      )
      case Some("'round'") => Seq(
        AddBlock(Simulink.MathOperations.RoundingFunction, blockPath),
        SetParam(blockPath, SimulinkParameterName("Operator"), "round")
      )
      case Some("'floor'") => Seq(
        AddBlock(Simulink.MathOperations.RoundingFunction, blockPath),
        SetParam(blockPath, SimulinkParameterName("Operator"), "floor")
      )
      case Some("'ceil'") => Seq(
        AddBlock(Simulink.MathOperations.RoundingFunction, blockPath),
        SetParam(blockPath, SimulinkParameterName("Operator"), "ceil")
      )
      case Some("'int'") => Seq(
        AddBlock(Simulink.MathOperations.RoundingFunction, blockPath),
        SetParam(blockPath, SimulinkParameterName("Operator"), "fix")
      )
      // Default value.
      case _ => mathFunc(blockPath, "exp")
    }) ++ commonProperties(path)
  }

  private def mathFunc(path: SimulinkPath, functionName: String): Seq[Expression] = Seq(
    AddBlock(Simulink.MathOperations.MathFunction, path),
    SetParam(path, SimulinkParameterName("Operator"), functionName)
  )
}
