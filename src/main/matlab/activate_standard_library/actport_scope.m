% activate = 'system/SignalViewers/Scope'
function out = actport_scope(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Sinks/Scope');
    block = setParamExpr(block, 'NumInputPorts', sprintf('%d', block.inputCount));
    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
