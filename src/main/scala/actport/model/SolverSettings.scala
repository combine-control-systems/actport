package actport.model

/** Model container for solver settings.
  *
  * @param initialTime       initial time of simulation
  * @param finalTime         final time of simulation
  * @param absoluteTolerance absolute tolerance of solver
  * @param relativeTolerance relative tolerance of solver
  * @param toleranceOnTime   tolerance on time of solver
  * @param realtimeScaling   realtime scaling
  * @param solver            solver algorithm
  * @param maxStepSize       maximum step size
  */
case class SolverSettings(initialTime: String,
                          finalTime: String,
                          absoluteTolerance: String,
                          relativeTolerance: String,
                          toleranceOnTime: String,
                          realtimeScaling: String,
                          solver: String,
                          maxStepSize: String)

object SolverSettings {
  /** Default values. */
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
