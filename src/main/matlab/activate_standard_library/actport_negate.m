% activate = 'system/MathOperations/Negate'
function model = actport_negate(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Unary Minus', block_path);
    %TODO: Handle overflow

    set_common_parameters(model, block_id, model_path);
end
