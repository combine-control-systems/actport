function model = actport_undefined(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    % Add an empty sub system.
    add_clean_subsystem(block_path);

    % Add all input ports.
    for i = 1:get_input_count(model, block_id)
        add_block('simulink/Ports & Subsystems/In1', sprintf('%s/In%d', block_path, i));
    end

    % Add all output ports.
    for i = 1:get_output_count(model, block_id)
        add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Out%d', block_path, i));
    end

    % Add a trigger port if we have one event and at least one explicit link port.
    if get_event_input_count(model, block_id) == 1 && ...
        (get_input_count(model, block_id) > 0 || ...
        get_output_count(model, block_id) > 0)

        add_block('simulink/Ports & Subsystems/Trigger', sprintf('%s/Trigger', block_path));
        set_param(sprintf('%s/Trigger', block_path), 'TriggerType', 'either');
        model = map_event_input_port(model, block_id, 1, 'Trigger');
    else
        for i = 1:get_event_input_count(model, block_id)
            add_block('simulink/Ports & Subsystems/In1', sprintf('%s/EventIn%d', block_path, i));
            model = map_event_input_port(model, block_id, i, sprintf('%d', get_input_count(model, block_id) + i));
        end
    end

    % Add all event output ports.
    for i = 1:get_event_output_count(model, block_id)
        add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/EventOut%d', block_path, i));
        model = map_event_output_port(model, block_id, i, sprintf('%d', get_output_count(model, block_id) + i));
    end

    % Add annotation.
    parameters = get_parameter_list(model, block_id);
    text = sprintf([...
        'Undefined block: ''%s''\n'...
        'Parameters:\n'...
    ], name);
    for i = 1:length(parameters)
        pair = parameters(i);
        text = [text, sprintf('%s = %s\n', char(pair(1)), char(pair(2)))];
    end

    note_path = sprintf('%s/note', block_path);
    note = Simulink.Annotation(note_path);
    note.text = text;

    % Show question mark.
    set_param(block_path, 'ShowPortLabels', 'none');
    mask = Simulink.Mask.create(block_path);
    mask.Display = sprintf('image(''%s'');\n', 'question_mark.png');

    set_common_parameters(model, block_id, model_path);
end
