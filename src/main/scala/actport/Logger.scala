package actport

import java.io.{File, FileWriter}

import scala.util.Using

object Logger {
  def initialize(filename: String) = {
    file = new File(filename)
    file.getParentFile.mkdirs()
    start = System.currentTimeMillis()
  }

  private var file: File = null
  private var start: Long = 0

  def log(msg: String): Unit =
    Using(new FileWriter(file, true)) { fw =>
      val delta = System.currentTimeMillis() - start
      val seconds = delta / 1000
      val millis = delta - seconds * 1000
      val output = f"[$seconds%3d.$millis%03d] $msg\n"
      // Write to file and screen.
      fw.write(output)
      System.out.print(output)
    }
}
