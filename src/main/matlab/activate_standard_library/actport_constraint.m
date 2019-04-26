% activate = 'system/MathOperations/Constraint'
function out = actport_constraint(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Algebraic Constraint');
    block = setParamExpr(block, 'InitialGuess', getParameter(block, 'x0', '0'));

    %TODO: Initial output derivatives is not supported by Simulink
    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end