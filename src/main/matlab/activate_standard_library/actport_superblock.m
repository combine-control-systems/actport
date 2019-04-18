% activate = 'SuperBlock'
function out = actport_superblock(diagram, block, blockName)
    import actport.GeneratorApi.*

    % Add an empty subsystem.
    block = addExpression(block, addCleanSubSystem(blockName));

    % Add a trigger port if necessary.
    if (block.eventInputCount == 1)
        block = addExpression(block, addBlock('simulink/Ports & Subsystems/Trigger', sprintf('%s/Trigger', blockName)));
        block = addPortMap(block, eventInputPort(1, 'Trigger'));
    end

    block = addCommonProperties(block, blockName);
    out = updateDiagram(diagram, block, blockName);
end
