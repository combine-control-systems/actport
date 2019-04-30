% activate = 'Subsystem'
function out = actport_subsystem(system, block)
    import actport.GeneratorApi.*

    % Add an empty subsystem.
    block = addCleanSubSystemExpr(block);

    % Add a trigger port if necessary.
    if (block.eventInputCount == 1)
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/Trigger', sprintf('%s/Trigger', block.name));
        block = setParamExpr(block, sprintf('%s/Trigger', block.name), 'TriggerType', 'either');
        block = mapEventInputPort(block, 1, 'Trigger');
    end

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
