% activate = 'system/MathOperations/Atan2
function model = actport_atan2(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Trigonometric Function', block_path);
    set_param(block_path, 'Operator', 'atan2');

    set_common_parameters(model, block_id, model_path);
end