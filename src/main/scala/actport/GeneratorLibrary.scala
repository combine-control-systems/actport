package actport

import java.io.File

import scala.io.Source
import scala.util.Using

class GeneratorLibrary(library: Map[String, String]) {
  def get(name: String, default: String): String = library.getOrElse(name, default)
}

object GeneratorLibrary {
  import fastparse._
  import NoWhitespace._
  private def blockNameParser[_: P]: P[String] = P("% activate = '" ~ (!"'" ~ AnyChar).rep.!)

  def scanLibrary(path: String): GeneratorLibrary = {
    def walkTree(file: File): Iterable[File] = {
      val children = new Iterable[File] {
        def iterator: Iterator[File] = if (file.isDirectory) {
          file.listFiles.filter(_.getName.endsWith(".m")).iterator
        } else Iterator.empty
      }
      Seq(file) ++: children.flatMap(walkTree)
    }

    val lib = walkTree(new File(path)).map { file =>
      // Read first line of each file found.
      Using(Source.fromFile(file, "UTF-8"))(_.getLines.take(1).mkString)
        .toOption
        // Parse the first line of each file found to check if it adheres to a pattern like:
        // % activate = 'system/SignalGenerators/Constant'
        .flatMap { firstRow =>
          parse(firstRow, blockNameParser(_)) match {
            case Parsed.Success(activateBlockName, _) =>
              Some((activateBlockName, file.getName.dropRight(2)))  // drop ".m" from filename
            case Parsed.Failure(label, index, _) =>
              System.err.println(s"Failed to scan ${file.getCanonicalPath} : $label : $index")
              None
          }
        }
    }.collect { case Some(v) => v }.toMap

    new GeneratorLibrary(lib)
  }
}
