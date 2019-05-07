% activate = 'system/Hybrid/Saturation'
function model = actport_saturation(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discontinuities/Saturation', block_path);
    set_param(block_path, 'UpperLimit', get_parameter(model, block_id, 'upper', '1'));
    set_param(block_path, 'LowerLimit', get_parameter(model, block_id, 'lower', '-1'));

    zcross = strcmp(get_parameter(model, block_id, 'zc', '0'), '0');
    if zcross
        set_param(block_path, 'ZeroCross', 'off');
    else
        set_param(block_path, 'ZeroCross', 'on');
    end

    set_common_parameters(model, block_id, model_path);
end
