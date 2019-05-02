% activate = 'system/Ports/EventInput'
function model = actport_event_input(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);

    block_path = sprintf('%s/%s', model_path, name);

    % TODO: We might need better logic to decide if the port should be an ordinary port or a trigger port, see
    %       EventPortIndex.scala#processPort.
    if get_event_input_count(model, block_id) == 1
        add_block('simulink/Ports & Subsystems/Trigger', block_path);
        model = map_event_input_port(model, block_id, get_parameter(model, block_id, 'portNumber', 1), 'Trigger');
    else
        add_block('simulink/Ports & Subsystems/In1', block_path);
        % We assume that all port numbers have been corrected in an earlier model transformation step.
        % Hence, we do not need to calculate a new port number here.
        set_param(block_path, 'Port', get_parameter(model, block_id, 'portNumber', '1'));
    end

    set_common_parameters(model, block_id, model_path);
end
