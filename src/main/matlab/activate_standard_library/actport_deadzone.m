% activate = 'system/Hybrid/Deadzone'
function model = actport_deadzone(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discontinuities/Dead Zone', block_path);
    set_param(block_path, 'UpperValue', get_parameter(model, block_id, 'upper', '0.5'));
    set_param(block_path, 'LowerValue', get_parameter(model, block_id, 'lower', '-0.5'));

    zcross = strcmp(get_parameter(model, block_id, 'zeroc', '0'), '0');
    if zcross
        set_param(block_path, 'ZeroCross', 'off');
    else
        set_param(block_path, 'ZeroCross', 'on');
    end

    set_common_parameters(model, block_id, model_path);
end
