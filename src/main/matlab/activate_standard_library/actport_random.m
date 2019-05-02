% activate = 'system/SignalGenerators/Random'
function model = actport_random(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_clean_subsystem(block_path);
    add_block('simulink/Ports & Subsystems/Trigger', sprintf('%s/Trigger', block_path), ...
        'TriggerType', 'either');

    distribution = get_parameter(model, block_id, 'distribution', '''Normal''');

    random_path = sprintf('%s/Random', block_path);

    switch distribution
        case '''Normal'''
            add_block('simulink/Sources/Random Number', random_path);
            add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Value', block_path));
            add_line(block_path, 'Random/1', 'Value/1');
            % Mean value.
            set_param(random_path, 'Mean', get_parameter(model, block_id, 'A', '0'));
            % Variance.
            set_param(random_path, 'Variance', get_parameter(model, block_id, 'B', '1'));
        case '''Uniform'''
            add_block('simulink/Sources/Uniform Random Number', random_path);
            add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Value', block_path));
            add_line(block_path, 'Random/1', 'Value/1');
            % Lower value.
            set_param(random_path, 'Minimum', get_parameter(model, block_id, 'A', '0'));
            % Range value.
            set_param(random_path, 'Maximum', get_parameter(model, block_id, 'B', '1'));
        otherwise
            error(sprintf('Unknown distribution %s', distribution));
    end

    set_param(random_path, 'Seed', get_parameter(model, block_id, 'seed', '0'));
    set_param(random_path, 'SampleTime', '-1');

    model = map_event_input_port(model, block_id, 1, 'Trigger');

    set_common_parameters(model, block_id, model_path);
end
