% activate = 'system/Ports/EventInput'
function out = actport_event_input(system, block)
    import actport.GeneratorApi.*

    % TODO: We might need better logic to decide if the port should be an ordinary port or a trigger port, see
    %       EventPortIndex.scala#processPort.
    if system.eventLinks.size() == 1
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/Trigger');
        system = system.mapEventInputPort(system, getParameter(block, 'portNumber', '1'), 'Trigger');
    else
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/In1');
    end
    % The port number is updated in the EventPortIndex transform
    % and the expression is added at that moment.
    % It is not possible to set a proper port number at this moment
    % since it is not known how many explicit input ports there
    % are until the entire model has been parsed.

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
