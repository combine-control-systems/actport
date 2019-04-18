% activate = 'system/SignalViewers/Scope'
function out = actport_scope(diagram, block, blockName)
    import actport.GeneratorApi.*

    block = addExpression(block, addBlock('simulink/Sinks/Scope', blockName));
    block = addExpression(block, setParam(blockName, 'NumInputPorts', sprintf('%d', block.inputCount)));
    block = addCommonProperties(block, blockName);
    out = updateDiagram(diagram, block, blockName);
end
