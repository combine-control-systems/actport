package actport.generators

import java.awt.Rectangle

import actport.simulink._
import actport.{ActivateBlock, ActivateStruct}

import scala.collection.JavaConverters._

object MatrixMultiplication extends Generator[ActivateBlock] {
  override def apply(path: SimulinkPath)(implicit block: ActivateBlock): Seq[Expression] = {
    val blockPath = path / block.name

    val p = block.parameters.asScala.toMap

    // Handle "H" which is a conjugate-transposed input which is multiplied. Simulink
    // only has "*" and "/". We need to add transpose blocks before each input.
    val signs = p.get("in_ports") match {
      case Some(dict: ActivateStruct) => dict.asScala.get("sgn") match {
        case Some(signs: Array[String]) => signs.map(_.replace("'", "")).mkString
        case _ => "**" // TODO: What should the default case be?
      }
      case _ => "**"
    }

    val product = if (signs.contains("H")) {
      wrappedProduct(blockPath, signs)
    } else {
      normalProduct(blockPath, p)
    }

    product ++ commonProperties(path)
  }

  private def normalProduct(blockPath: SimulinkPath, p: Map[String, Any]): Seq[Expression] = {
    Seq(
      AddBlock(Simulink.MathOperations.Product, blockPath),
      SetParam(blockPath, SimulinkParameterName("Multiplication"), "Matrix(*)"),
      SetParam(blockPath, SimulinkParameterName("Inputs"), p.get("in_ports") match {
        case Some(dict: ActivateStruct) => dict.asScala.get("sgn") match {
          case Some(signs: Array[String]) => signs.map(_.replace("'", "")).mkString
          case _ => "**" // TODO: What should the default case be?
        }
        case _ => "**"
      })
    )
  }

  private def wrappedProduct(blockPath: SimulinkPath, signs: String): Seq[Expression] = {
    val col1 = 0
    val col2 = 50
    val col3 = 200
    val col4 = 400

    // We need to handle conjugate-transposed input separately and put it inside a subsystem.
    val subsystem: Seq[Expression] = Seq(
      AddCleanSubsystem(blockPath),
      // Add product block.
      AddBlock(Simulink.MathOperations.Product, blockPath / "Product"),
      SetParam(blockPath / "Product", SimulinkParameterName("Inputs"), signs.replace("H", "*")),
      // Add output port.
      AddBlock(Simulink.PortsAndSubsystems.Out1, blockPath / "Out1"),
      SetParam(blockPath / "Out1", SimulinkParameterName("Position"),
        new Rectangle(col4, 0, 16, 16)),
      // Connect product block and output port.
      AddLine(blockPath, SimulinkPort(s"Product/1"), SimulinkPort(s"Out1/1"), SmartAutoRouting),
      SetParam(blockPath / "Product", SimulinkParameterName("Position"), new Rectangle(col3, 0, 25, 100))
    )

    val inputs: Seq[Expression] = signs.chars.toArray.zipWithIndex.flatMap { case (sign, index) =>
      val transposeName = s"Transpose${index + 1}"
      val inputPortName = s"In${index + 1}"
      sign match {
        // For the Hermitian case we have to add a conjugate transpose block and wire up that.
        case 'H' => Seq(
          // Input port.
          AddBlock(Simulink.PortsAndSubsystems.In1, blockPath / inputPortName),
          SetParam(blockPath / inputPortName, SimulinkParameterName("Position"),
            new Rectangle(col1, -index * 30, 16, 16)),
          // Transpose block.
          AddBlock(Simulink.MathOperations.MathFunction, blockPath / transposeName),
          SetParam(blockPath / transposeName, SimulinkParameterName("Position"),
            new Rectangle(col2, -index * 30, 16, 16)),
          SetParam(blockPath / transposeName, SimulinkParameterName("Operator"), "hermitian"),
          // Connect port, transpose and product.
          AddLine(blockPath, SimulinkPort(s"$inputPortName/1"), SimulinkPort(s"$transposeName/1"), SmartAutoRouting),
          AddLine(blockPath, SimulinkPort(s"$transposeName/1"), SimulinkPort(s"Product/${index + 1}"), SmartAutoRouting)
        )
        case '*' | '/' => Seq(
          // Input port.
          AddBlock(Simulink.PortsAndSubsystems.In1, blockPath / s"In${index + 1}"),
          SetParam(blockPath / inputPortName, SimulinkParameterName("Position"),
            new Rectangle(col1, -index * 30, 16, 16)),
          // Connect port with product.
          AddLine(blockPath, SimulinkPort(s"In${index + 1}/1"), SimulinkPort(s"Product/${index + 1}"), SmartAutoRouting)
        )
        case s =>
          throw new RuntimeException(s"Invalid matrix multiplication sign $s in $signs")
          Seq.empty
      }
    }

    subsystem ++ inputs
  }
}
