% activate = 'system/Dynamical/VariableDelay'
function model = actport_variable_delay(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    dtype = get_parameter(model, block_id, 'dtype', '''Time''');

    switch dtype
        case '''Time'''
            add_block('simulink/Continuous/Variable Time Delay', block_path);
        case '''Transport'''
            add_block('simulink/Continuous/Variable Transport Delay', block_path);
    end

    maximum_delay = get_parameter(model, block_id, 'T', '1');
    initial_output = get_parameter(model, block_id, 'init', '0');
    initial_buffer_size = get_parameter(model, block_id, 'N', '1000');

    set_param(block_path, 'MaximumDelay', maximum_delay);
    set_param(block_path, 'InitialOutput', initial_output);
    set_param(block_path, 'MaximumPoints', initial_buffer_size);

    % Should the buffer have fixed size or not?

    set_common_parameters(model, block_id, model_path);
end
