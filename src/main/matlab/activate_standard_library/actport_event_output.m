% activate = 'system/Ports/EventOutput'
function out = actport_event_input(system, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1');
    % The port number is updated in the EventPortIndex transform.
    % It is not possible to set a proper port number at this moment
    % since it is not known how many explicit output ports there
    % are until the entire model has been parsed.

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
