% activate = 'system/MathOperations/Hypot'
function out = actport_hypot(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
    block = setParamExpr(block, 'Operator', 'hypot');

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
