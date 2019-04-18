% activate = 'SuperBlock'
function out = actport_superblock(diagram, block)
    import actport.GeneratorApi.*

    % Add an empty subsystem.
    block = addCleanSubSystemExpr(block);

    % Add a trigger port if necessary.
    if (block.eventInputCount == 1)
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/Trigger', sprintf('%s/Trigger', block.name));
        block = mapEventInputPort(block, 1, 'Trigger');
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
