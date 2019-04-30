% activate = 'system/SignalGenerators/Constant'
function out = actport_constant(system, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Sources/Constant');
    block = setParamExpr(block, 'Value', getParameter(block, 'C', '1'));

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
