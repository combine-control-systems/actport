% activate = 'system/Ports/Input'
function out = actport_inputport(diagram, block, blockName)
    import actport.GeneratorApi.*

    block = addExpression(block, addBlock('simulink/Ports & Subsystems/In1', blockName));
    block = addCommonProperties(block, blockName);
    out = updateDiagram(diagram, block, blockName);
end
