% activate = 'system/Dynamical/PID'
function model = actport_pid(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Continuous/PID Controller', block_path);

    Kp = get_parameter(model, block_id, 'Kp', '1');
    Ki = get_parameter(model, block_id, 'Ki', '0');
    Kd = get_parameter(model, block_id, 'Kd', '0');
    filter_coefficient = get_parameter(model, block_id, 'N', '100');

    set_param(block_path, 'P', Kp);
    set_param(block_path, 'I', Ki);
    set_param(block_path, 'D', Kd);
    set_param(block_path, 'N', filter_coefficient);

    set_common_parameters(model, block_id, model_path);
end
