% activate = 'system/MathOperations/Atan2
function out = actport_atan2(diagram, block)
    import actport.GeneratorApi.*


    block = addBlockExpr(block, 'simulink/Math Operations/Trigonometric Function');
    block = setParamExpr(block, 'Operator', 'atan2');

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end