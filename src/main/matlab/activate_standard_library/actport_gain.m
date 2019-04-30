% activate = 'system/MathOperations/Gain'
function out = actport_gain(system, block)
    import actport.GeneratorApi.*

    gain = getParameter(block, 'gain', '1');

    block = addBlockExpr(block, 'simulink/Math Operations/Gain');
    block = setParamExpr(block, 'Gain', gain);

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
