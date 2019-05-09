% activate = 'system/MathOperations/Pow'
function model = actport_pow(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Math Function', block_path);
    set_param(block_path, 'Operator', 'pow');

    set_common_parameters(model, block_id, model_path);
end
