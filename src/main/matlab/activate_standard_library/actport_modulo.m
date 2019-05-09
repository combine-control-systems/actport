% activate = 'system/MathOperations/Modulo'
function model = actport_modulo(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Math Function', block_path);
    op = get_parameter(model, block_id, 'op', 'Modulo');
    if strcmp(op, 'Modulo')
        set_param(block_path, 'Operator', 'mod');
    else
        set_param(block_path, 'Operator', 'rem');
    end

    set_common_parameters(model, block_id, model_path);
end
