function out = actport_undefined(diagram, block, blockName)
    import actport.GeneratorApi.*

    % Add an empty sub system.
    block = addExpression(block, addCleanSubSystem(blockName));

    % Add all input ports.
    for i = 1:block.inputCount
        block = addExpression(block, addBlock('simulink/Ports & Subsystems/In1', sprintf('%s/In%d', blockName, i)));
    end

    % Add all output ports.
    for i = 1:block.outputCount
        block = addExpression(block, addBlock('simulink/Ports & Subsystems/Out1', sprintf('%s/Out%d', blockName, i)));
    end

    % Add a trigger port if we have one event input port.
    if block.eventInputCount == 1
        block = addExpression(block, addBlock('simulink/Ports & Subsystems/Trigger', sprintf('%s/Trigger', blockName)));
        block = addPortMap(block, eventInputPort(1, 'Trigger'));
    end

    % Add another output port if we have one event output port.
    if block.eventOutputCount == 1
        block = addExpression(block, addBlock('simulink/Ports & Subsystems/Out1', sprintf('%s/Event', blockName)));
        block = addPortMap(block, eventInputPort(1, sprintf('%d', block.outputCount + 1)));
    end

    block = addCommonProperties(block, blockName);
    out = updateDiagram(diagram, block, blockName);
end
