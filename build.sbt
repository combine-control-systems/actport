lazy val commonSettings = Seq(
  version := "0.1-SNAPSHOT",
  organization := "se.combine",
  scalaVersion := "2.12.8",
  test in assembly := {}
)

lazy val actport = (project in file(".")).
  settings(commonSettings: _*).
  settings(
//    unmanagedBase := file("C:\\Program Files\\MATLAB\\R2019a\\java\\jar")
//    mainClass in assembly := Some("com.example.Main"),
  )
