package actport

import java.io.File

import scala.io.Source
import scala.util.Using

/** Library to lookup block generator functions implemented in Matlab.
  *
  * The key of the library is the Activate block identifier, e.g.
  * `system/SignalGenerators/Constant`.
  *
  * The value is the name of the file where the generator function
  * can be found.
  *
  * @param library library lookup table
  */
class GeneratorLibrary(library: Map[String, String]) {
  /** Get Matlab function name from the library.
    *
    * @param name    Activate block identifier
    * @param default default Matlab generator function to use if not found
    * @return name of Matlab generator function
    */
  def get(name: String, default: String): String = library.getOrElse(name, default)

  /** Show all items in the library.
    *
    * Used for debugging purposes.
    */
  def show: Unit = {
    library.foreach { case (k, v) => println(s"$k -> $v") }
  }
}

object GeneratorLibrary {

  import fastparse._
  import NoWhitespace._

  // Parser for Matlab generator function source code files.
  // Each file needs to start with e.g.:
  //   % activate = 'system/SignalGenerators/Constant'
  private def blockNameParser[_: P]: P[String] = P("% activate = '" ~ (!"'" ~ AnyChar).rep.!)

  /** Scan the library and construct the database.
    *
    * @param path path to scan for Matlab generator functions
    * @return a new GeneratorLibrary
    */
  def scanLibrary(path: String): GeneratorLibrary = {
    // Walk the directory tree to find all available files.
    // It is up to the Matlab user to make sure that the
    // files are present in the Matlab path in order to
    // be able to call them.
    def walkTree(file: File): Iterable[File] = {
      val children = new Iterable[File] {
        def iterator: Iterator[File] = if (file.isDirectory) {
          // Only files ending with *.m
          file.listFiles.filter(_.getName.endsWith(".m")).iterator
        } else Iterator.empty
      }
      Vector(file) ++: children.flatMap(walkTree)
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
            Some((activateBlockName, file.getName.dropRight(2))) // drop ".m" from filename
          case Parsed.Failure(label, index, _) =>
            System.err.println(s"Failed to scan ${file.getCanonicalPath} : $label : $index")
            None
        }
      }
      // Collect files which were successfully parsed.
    }.collect { case Some(v) => v }.toMap

    new GeneratorLibrary(lib)
  }
}
