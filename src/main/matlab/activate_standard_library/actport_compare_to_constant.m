% activate = 'system/LogicalOperations/CompareToConstant'
function model = actport_compare_to_constant(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Logic and Bit Operations/Compare To Constant', block_path);
    set_param(block_path, 'relop', strrep(get_parameter(model, block_id, 'op', '''=='''), '''', ''));
    set_param(block_path, 'const', get_parameter(model, block_id, 'C', '0'));
    if strcmp(get_parameter(model, block_id, 'zcr', '0'), '0');
        set_param(block_path, 'ZeroCross', 'off');
    else
        set_param(block_path, 'ZeroCross', 'on');
    end

    set_common_parameters(model, block_id, model_path);
end