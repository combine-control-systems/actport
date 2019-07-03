# Ported blocks information

List of blocks available to port from Activate to Simulink. Blocks might have all possible functionality implemented in Simulink or there might be some of it pending. The TODOs on each block are gathered in this file. Please be also aware that full Activate functionality might not be feasible in Simulink for some blocks. Carefully check the information and warnings printed in MATLAB while executing import_activate_oml.
* Subsystem
* system/ActivationOperations/End
* system/ActivationOperations/EventClock
* system/ActivationOperations/EventDelay
* system/ActivationOperations/EventGenerate
* system/ActivationOperations/InitialEvent
* system/ActivationOperations/SampleClock
  * This will fail if we have variables in array.
  * This will fail if we have variables in array.
* system/ActivationOperations/ZeroCross
* system/AdvancedDynamical/ContStateSpace_SS
* system/AdvancedDynamical/ContStateSpace_Y
* system/AdvancedDynamical/ContTransFunc_SS
* system/AdvancedDynamical/ContTransFunc_X
* system/AdvancedDynamical/ContTransFunc_Y
* system/BitOperations/BitsExtraction
* system/BitOperations/ClearBit
* system/BitOperations/SetBit
* system/BitOperations/ShiftBits
* system/Dynamical/ContPoleZero
* system/Dynamical/ContStateSpace
* system/Dynamical/ContTransFunc
* system/Dynamical/Derivative
* system/Dynamical/DiscrPoleZero
* system/Dynamical/DiscrStateSpace
* system/Dynamical/DiscrTransFunc
* system/Dynamical/DiscreteDelay
* system/Dynamical/DiscreteDerivative
* system/Dynamical/DiscreteIntegral
  * Implement reset
* system/Dynamical/FixedDelay
* system/Dynamical/Integral
  * Also set how the external signal re-initializes the integrator (see "ExternalReset").
* system/Dynamical/Memory
* system/Dynamical/PID
* system/Dynamical/SampledData
* system/Dynamical/VariableDelay
* system/Hybrid/Backlash
* system/Hybrid/ControlledDeadzone
* system/Hybrid/ControlledRateLimiter
* system/Hybrid/ControlledSaturation
* system/Hybrid/Deadzone
* system/Hybrid/LastInput
* system/Hybrid/Quantization
  * Several rounding methods in activate not available in Simulink. Maybe manual implementation
* system/Hybrid/RateLimiter
* system/Hybrid/SampleHold
* system/Hybrid/Saturation
* system/LogicalOperations/CompareToConstant
* system/LogicalOperations/LogicalOp
* system/LogicalOperations/RelationalOp
* system/LogicalOperations/TruthTable
* system/LookupTables/LookupTable
  * Lookup Table Dynamic seems to support this.
  * Lookup Table Dynamic seems to support this.
* system/LookupTables/LookupTable2D
* system/LookupTables/LookupTable3D
* system/LookupTables/LookupTableND
* system/MathOperations/Abs
  * Handle overflow properly
* system/MathOperations/Atan2
* system/MathOperations/Bias
  * Handle overflow properly
* system/MathOperations/Constraint
  * Initial output derivatives is not supported by Simulink
* system/MathOperations/Exponential
* system/MathOperations/Gain
* system/MathOperations/Horner
* system/MathOperations/Hypot
* system/MathOperations/Log
* system/MathOperations/MathExpression
* system/MathOperations/MathExpressions
* system/MathOperations/MathFunc
* system/MathOperations/MaxMin
* system/MathOperations/Modulo
* system/MathOperations/Negate
  * Handle overflow
* system/MathOperations/OmlExpression
* system/MathOperations/Pow
* system/MathOperations/Power
* system/MathOperations/Product
  * Handle overflow properly
* system/MathOperations/RoundProduct
  * Handle overflow properly
* system/MathOperations/Sign
  * Handle overflow properly
* system/MathOperations/Sum
* system/MathOperations/TrigFunc
* system/MatrixOperations/CumulativeSum
* system/MatrixOperations/DiagonalMatrix
* system/MatrixOperations/Eigenvalues
* system/MatrixOperations/FFT
* system/MatrixOperations/LUFactorization
* system/MatrixOperations/MatrixConcatenation
* system/MatrixOperations/MatrixDivision
* system/MatrixOperations/MatrixExponential
* system/MatrixOperations/MatrixExpression
* system/MatrixOperations/MatrixExtractor
* system/MatrixOperations/MatrixGain
  * Handle "Error" case properly.
* system/MatrixOperations/MatrixInverse
* system/MatrixOperations/MatrixMultiplication
* system/MatrixOperations/MatrixNorm
* system/MatrixOperations/MatrixReshape
* system/MatrixOperations/MaxElements
* system/MatrixOperations/MinElements
* system/MatrixOperations/Sort
* system/MatrixOperations/SumElements
  * Handle "Error" case properly.
* system/MatrixOperations/Transpose
* system/Ports/EventInput
  * We might need better logic to decide if the port should be an ordinary port or a trigger port.
* system/Ports/EventOutput
* system/Ports/Input
* system/Ports/Output
* system/Routing/ConditionalNSelect
* system/Routing/ConditionalSelect
* system/Routing/Demux
* system/Routing/Extractor
* system/Routing/GetSignal
* system/Routing/ManualSelect
* system/Routing/Merge
* system/Routing/Mux
* system/Routing/SetSignal
* system/Routing/SignalScoping
* system/SignalConversions/DatatypeConversion
  * Handle "Error" case properly.
* system/SignalGenerators/Constant
* system/SignalGenerators/ContinuousRandom
* system/SignalGenerators/Counter
* system/SignalGenerators/ModuloCounter
* system/SignalGenerators/Ramp
* system/SignalGenerators/RampSaturate
* system/SignalGenerators/Random
* system/SignalGenerators/Sawtooth
* system/SignalGenerators/SignalGenerator
* system/SignalGenerators/SineWaveGenerator
  * Check results for external activation set on
* system/SignalGenerators/SquareWaveGenerator
* system/SignalGenerators/StepGenerator
* system/SignalGenerators/Time
* system/SignalGenerators/Toggle
* system/SignalGenerators/Trapezoid
* system/SignalGenerators/VariableFreqSine
* system/SignalProperties/Sink
* system/SignalViewers/Display
  * Parse format string and translate to closest Simulink equivalent among the values
  * "dt" (Activate) and "decimation" (Simulink) are not equivalent. "dt" is given in seconds
* system/SignalViewers/EventScope
* system/SignalViewers/Scope
* system/SignalViewers/ScopeXY
