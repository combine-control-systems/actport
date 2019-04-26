% activate = 'system/MathOperation/Bias'
function out = actport_bias(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Bias');

    block = setParamExpr(block, 'Bias', getParameter(block, 'Bias', '0.0'));
    %TODO: Handle overflow properly

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
