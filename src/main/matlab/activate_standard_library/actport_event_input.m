% activate = 'system/Ports/EventInput'
function model = actport_event_input(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);

    block_path = sprintf('%s/%s', model_path, name);

    % TODO: We might need better logic to decide if the port should be an ordinary port or a trigger port.
    if get_event_input_count(model, block_id) == 1
        model = map_event_input_port(model, block_id, get_parameter(model, block_id, 'portNumber', 1), 'Trigger');
    end

    port_number = str2double(get_parameter(model, block_id, 'portNumber', '1'));
    port = char(get_mapped_event_input_port(model, block_id, port_number));

    if ~isempty(port)
        switch(port)
            case 'Trigger'
                add_block('simulink/Ports & Subsystems/Trigger', block_path);
            otherwise
                add_block('simulink/Ports & Subsystems/In1', block_path);
                set_param(block_path, 'Port', port);
        end
    end

    set_common_parameters(model, block_id, model_path);
end
