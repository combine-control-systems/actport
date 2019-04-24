function out = actport_undefined(diagram, block, blockName)
    import actport.GeneratorApi.*

    % Add an empty sub system.
    block = addCleanSubSystemExpr(block);

    % Add all input ports.
    for i = 1:block.inputCount
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/In1', sprintf('%s/In%d', block.name, i));
    end

    % Add all output ports.
    for i = 1:block.outputCount
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1', sprintf('%s/Out%d', block.name, i));
    end

    % Add a trigger port if we have one event input port.
    if block.eventInputCount == 1
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/Trigger', sprintf('%s/Trigger', block.name));
        block = mapEventInputPort(block, 1, 'Trigger');
    end

    % Add another output port if we have one event output port.
    if block.eventOutputCount == 1
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1', sprintf('%s/Event', block.name));
        block = mapEventOutputPort(block, 1, sprintf('%d', block.outputCount + 1));
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
