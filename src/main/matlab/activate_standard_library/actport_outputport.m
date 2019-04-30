% activate = 'system/Ports/Output'
function out = actport_outputport(system, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1');
    block = setParamExpr(block, 'Port', getParameter(block, 'portNumber', '1'));

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
