% activate = 'system/SignalGenerators/Constant'
function out = actport_constant(diagram, block, blockName)
    import actport.GeneratorApi.*

    block = addExpression(block,addBlock('simulink/Sources/Constant', blockName));
    block = addExpression(block,setParam(blockName, 'Value', getParameter(block, 'Value', '1')));

    out = updateDiagram(diagram, block, blockName);
end
