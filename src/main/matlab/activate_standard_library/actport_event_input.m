% activate = 'system/Ports/EventInput'
function model = actport_event_input(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);

    block_path = sprintf('%s/%s', model_path, name);

    % TODO: We might need better logic to decide if the port should be an ordinary port or a trigger port.
%    if get_event_input_count(model, block_id) == 1
%        model = map_event_input_port(model, block_id, get_parameter(model, block_id, 'portNumber', 1), 'Trigger');
%    end

    port_number = str2double(get_parameter(model, block_id, 'portNumber', '1'));
    parent_id = get_parent(model, block_id);
    if parent_id ~= -1
        port = char(get_mapped_event_input_port(model, parent_id, port_number));
        fprintf('HERE : Path: %s : BlockId = %d : ParentId = %d  : ActivatePort: %d -> SimulinkPort: %s\n', block_path, block_id, parent_id, port_number, port);
    else
        % Default to the given port if there is no parent present.
        port = num2str(port_number);
        fprintf('THERE : %s : %d -> %s\n', block_path, port_number, port);
    end

    if ~isempty(port)
        switch(port)
            case 'Trigger'
                add_block('simulink/Ports & Subsystems/Trigger', block_path);
            otherwise
                add_block('simulink/Ports & Subsystems/In1', block_path);
                set_param(block_path, 'Port', port);
        end
        set_common_parameters(model, block_id, model_path);
    end
    % Don't add anything if the port is invalid.
end
