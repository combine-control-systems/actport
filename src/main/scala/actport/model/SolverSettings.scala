package actport.model

case class SolverSettings(initialTime: String,
                          finalTime: String,
                          absoluteTolerance: String,
                          relativeTolerance: String,
                          toleranceOnTime: String,
                          realtimeScaling: String,
                          solver: String,
                          maxStepSize: String)

object SolverSettings {
  def default: SolverSettings = SolverSettings(
    initialTime = "0.0",
    finalTime = "30.0",
    absoluteTolerance = "0.00000001",
    relativeTolerance = "0.00000001",
    toleranceOnTime = "-1",
    realtimeScaling = "1",
    solver = "lsodar",
    maxStepSize = "-1"
  )
}
