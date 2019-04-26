% activate = 'system/MathOperations/RoundProduct'
function out = actport_roundproduct(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Product');
    block = setParamExpr(block, 'Multiplication', 'Element-wise(.*)');
    block = setParamExpr(block, 'Inputs', '**');
    %TODO: Handle overflow properly

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end