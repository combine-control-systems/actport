% activate = 'system/MathOperations/Pow'
function out = actport_pow(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
    block = setParamExpr(block, 'Operator', 'pow');

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
