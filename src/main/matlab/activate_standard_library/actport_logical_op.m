% activate = 'system/LogicalOperations/LogicalOp'
function model = actport_logical_op(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    bitwise = strcmp(get_parameter(model, block_id, 'tp', '0'), '1');
    inputCount = get_input_count(model, block_id);
    operator = char(strrep(get_parameter(model, block_id, 'rule', 'AND'), '''', ''));

    if bitwise
        add_block('simulink/Logic and Bit Operations/Bitwise Operator', block_path);
        set_param(block_path, 'UseBitMask', 'off');
        set_param(block_path, 'NumInputPorts', num2str(inputCount));
        set_param(block_path, 'Operator', operator);
    else
        add_block('simulink/Logic and Bit Operations/Logical Operator', block_path);
        set_param(block_path, 'Inputs', num2str(inputCount));
        set_param(block_path, 'Operator', operator);
    end

    set_common_parameters(model, block_id, model_path);
end
