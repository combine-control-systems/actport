% activate = 'system/Ports/Input'
function out = actport_inputport(system, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Ports & Subsystems/In1');
    block = setParamExpr(block, 'Port', getParameter(block, 'portNumber', '1'));

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
