% activate = 'system/MathOperations/Gain'
function out = actport_gain(diagram, block)
    import actport.GeneratorApi.*

    gain = getParameter(block, 'gain', '1');

    block = addBlockExpr(block, 'simulink/Math Operations/Gain');
    block = setParamExpr(block, 'Gain', gain);

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
