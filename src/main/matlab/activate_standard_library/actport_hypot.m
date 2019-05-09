% activate = 'system/MathOperations/Hypot'
function model = actport_hypot(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Math Function');
    set_param(block_path, 'Operator', 'hypot');

    set_common_parameters(model, block_id, model_path);
end
