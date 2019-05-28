% activate = 'system/ActivationOperations/EventGenerate'
function model = actport_event_generate(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    event_times = get_parameter(model, block_id, 'etimes/time', {'1'});

    add_clean_subsystem(block_path);

    for i = 1:length(event_times)
        step_path = sprintf('%s/Event%d', block_path, i);
        add_block('simulink/Sources/Step', step_path);
        set_param(step_path, 'Time', char(event_times(i)));
        add_block('simulink/Sinks/Out1', sprintf('%s/Out%d', block_path, i));
        add_line(block_path, sprintf('Event%d/1', i), sprintf('Out%d/1', i));
    end

    Simulink.BlockDiagram.arrangeSystem(block_path);

    model = swap_width_and_height(model, block_id);
    model = rotate_clockwise(model, block_id);

    set_common_parameters(model, block_id, model_path);
end
