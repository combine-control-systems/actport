% activate = 'system/Hybrid/Backlash'
function model = actport_backlash(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discontinuities/Backlash', block_path);
    set_param(block_path, 'BacklashWidth', get_parameter(model, block_id, 'gap', '1'));
    set_param(block_path, 'InitialOutput', get_parameter(model, block_id, 'ini', '-1'));

    zcross = strcmp(get_parameter(model, block_id, 'zcr', '0'), '0');
    if zcross
        set_param(block_path, 'ZeroCross', 'off');
    else
        set_param(block_path, 'ZeroCross', 'on');
    end

    set_common_parameters(model, block_id, model_path);
end
