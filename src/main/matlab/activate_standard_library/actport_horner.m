% activate = 'system/MathOperations/Horner'
function model = actport_horner(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Polynomial');
    set_param(block_path, 'Multiplication', 'Element-wise(.*)');

    set_common_parameters(model, block_id, model_path);
end