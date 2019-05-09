% activate = 'system/MathOperations/Abs'
function model = actport_abs(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Abs', block_path);

    zcross = strcmp(get_parameter(model, block_id, 'zcross', '0'), '0');
    if zcross
        set_param(block_path, 'ZeroCross', 'off');
    else
        set_param(block_path, 'ZeroCross', 'on');
    end
    %TODO: Handle overflow properly


    set_common_parameters(model, block_id, model_path);
end
