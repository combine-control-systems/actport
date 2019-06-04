% activate = 'system/Dynamical/Integral'
function model = actport_integral(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Continuous/Integrator', block_path);

    x0 = get_parameter(model, block_id, 'x0', '0');
    set_param(block_path, 'InitialCondition', x0);

    % TODO: Also set how the external signal re-initializes the integrator (see "ExternalReset").
    if strcmp(get_parameter(model, block_id, 'reinit', '0'), '1')
        set_param(block_path, 'InitialConditionSource', 'external');
    else
        set_param(block_path, 'InitialConditionSource', 'internal');
    end

    if strcmp(get_parameter(model, block_id, 'satur', '0'), '1')
        set_param(block_path, 'LimitOutput', 'on');
    else
        set_param(block_path, 'LimitOutput', 'off');
    end

    set_param(block_path, 'UpperSaturationLimit', get_parameter(model, block_id, 'max', 'inf'));
    set_param(block_path, 'LowerSaturationLimit', get_parameter(model, block_id, 'min', '-inf'));
    set_param(block_path, 'ZeroCross', get_parameter(model, block_id, 'zcross', 'off'));

    set_common_parameters(model, block_id, model_path);
end
