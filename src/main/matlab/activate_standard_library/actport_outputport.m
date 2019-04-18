% activate = 'system/Ports/Output'
function out = actport_outputport(diagram, block, blockName)
    import actport.GeneratorApi.*

    block = addExpression(block, addBlock('simulink/Ports & Subsystems/Out1', blockName));
    block = addCommonProperties(block, blockName);
    out = updateDiagram(diagram, block, blockName);
end
