% activate = 'system/LogicalOperations/RelationalOp'
function model = actport_relational_op(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Logic and Bit Operations/Relational Operator', block_path);

    % Remove quotes from the rule.
    rule = strrep(get_parameter(model, block_id, 'rule', '''<'''), '''', '');
    set_param(block_path, 'Operator', rule);

    zero_crossing_detection = get_parameter(model, block_id, 'zcr', '0');
    if strcmp(zero_crossing_detection, '1')
        set_param(block_path, 'ZeroCross', 'on');
    else
        set_param(block_path, 'ZeroCross', 'off');
    end
end
