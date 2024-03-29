% activate = 'system/SignalGenerators/Random'
function model = actport_random(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    distribution = char(get_parameter(model, block_id, 'distribution', '''Normal'''));

    switch distribution
        case '''Normal'''
            add_block('simulink/Sources/Random Number', block_path);
            % Mean value.
            set_param(block_path, 'Mean', char(get_parameter(model, block_id, 'A', '0')));
            % Variance.
            set_param(block_path, 'Variance', char(get_parameter(model, block_id, 'B', '1')));
        case '''Uniform'''
            add_block('simulink/Sources/Uniform Random Number', block_path);
            % Range value.
            set_param(block_path, 'Maximum', char(get_parameter(model, block_id, 'B', '1')));
            % Lower value.
            set_param(block_path, 'Minimum', char(get_parameter(model, block_id, 'A', '0')));
        otherwise
            logger(sprintf('Unknown distribution %s', distribution), block_path);
    end

    set_param(block_path, 'Seed', char(get_parameter(model, block_id, 'seed', '0')));
    set_param(block_path, 'SampleTime', '-1');

    % Do not allow any external event links to connect to this block.
    model = set_event_input_port_invalid(model, block_id, 1);

    set_common_parameters(model, block_id, model_path);
end
