% activate = 'Subsystem'
function model = actport_subsystem(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    % Add an empty subsystem.
    add_clean_subsystem(block_path);

    % Add a trigger port if necessary.
    if (get_event_input_count(model, block_id) == 1)
        add_block('simulink/Ports & Subsystems/Trigger', sprintf('%s/Trigger', block_path));
        set_param(sprintf('%s/Trigger', block_path), 'TriggerType', 'either');
        model = map_event_input_port(model, block_id, 1, 'Trigger');
    end

    set_common_parameters(model, block_id, model_path);
end
