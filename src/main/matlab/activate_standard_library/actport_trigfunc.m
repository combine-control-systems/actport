% activate = 'system/MathOperations/TrigFunc'
function out = actport_trigfunc(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Trigonometric Function');

    % All functions available in Activate have the same name in Simulink
    func = getParameter(block, 'func', '''sin''');
    block = setParamExpr(block, 'Operator', func(2:end-1));

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
