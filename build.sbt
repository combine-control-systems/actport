lazy val commonSettings = Seq(
  version := "0.1-SNAPSHOT",
  organization := "se.combine",
  scalaVersion := Settings.scalaVersion,
  test in assembly := {}
)

lazy val actport = (project in file(".")).
  settings(commonSettings: _*).
  settings(
    libraryDependencies ++= Seq(
      "com.github.bigwheel" %% "util-backports" % Settings.backportsVersion,
      "com.lihaoyi" %% "fastparse" % Settings.fastparseVersion,
      "org.scalatest" %% "scalatest" % Settings.scalaTestVersion % Test,
      "org.scalacheck" %% "scalacheck" % Settings.scalaCheckVersion % Test
    ))
