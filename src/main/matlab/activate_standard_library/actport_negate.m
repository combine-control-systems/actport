% activate = 'system/MathOperations/Negate'
function out = actport_negate(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Unary Minus');
    %TODO: Handle overflow

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
