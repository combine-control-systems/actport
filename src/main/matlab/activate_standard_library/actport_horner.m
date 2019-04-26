% activate = 'system/MathOperations/Horner'
function out = actport_horner(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Polynomial');
    block = setParamExpr(block, 'Multiplication', 'Element-wise(.*)');

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end