% activate = 'system/MathOperations/MaxMin'
function model = actport_maxmin(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/MinMax', block_path);
    minmax = get_parameter(model, block_id, 'mm', '''Max''');
    set_param(block_path, 'Function', strrep(lower(minmax), '''', ''));
    set_param(block_path, 'Inputs', get_parameter(model, block_id, 'nin', '2'));

    zcross = strcmp(get_parameter(model, block_id, 'zc', '0'), '0');
    if zcross
        set_param(block_path, 'ZeroCross', 'off');
    else
        set_param(block_path, 'ZeroCross', 'on');
    end

    set_common_parameters(model, block_id, model_path);
end
