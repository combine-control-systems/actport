% activate = 'system/Dynamical/DiscreteIntegral'
function model = actport_discrete_integral(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discrete/Discrete-Time Integrator', block_path);
    logger(sprintf('Block %s does not support complex data type in Simulink', block_path));

    % Method
    switch get_parameter(model, block_id, 'method', '''Forward Euler''')
        case '''Forward Euler'''
            set_param(block_path, 'IntegratorMethod', 'Integration: Forward Euler');
        case '''Backward Euler'''
            set_param(block_path, 'IntegratorMethod', 'Integration: Backward Euler');
        case '''Trapezoidal'''
            set_param(block_path, 'IntegratorMethod', 'Integration: Trapezoidal');
    end

    % Initialization
    if strcmp(get_parameter(model, block_id, 'reinit', '1'), '1')
        logger(sprintf('Reinitialization of block %s is not implemented for Simulink', block_path));
        %TODO: Implement reset
    end
    set_param(block_path, 'InitialConditionSource', 'internal');
    set_param(block_path, 'InitialCondition', get_parameter(model, block_id, 'x0', '0'));

    % Saturation
    if strcmp(get_parameter(model, block_id, 'satur', '1'), '1')
        set_param(block_path, 'LimitOutput', 'on');
        up = get_parameter(model, block_id, 'limit/max', '[1]');
        low = get_parameter(model, block_id, 'limit/min', '[-1]');
        set_param(block_path, 'UpperSaturationLimit', char(up));
        set_param(block_path, 'LowerSaturationLimit', char(low));
    else
        set_param(block_path, 'LimitOutput', 'off');
    end

    set_common_parameters(model, block_id, model_path);
end
