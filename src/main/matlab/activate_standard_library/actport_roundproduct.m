% activate = 'system/MathOperations/RoundProduct'
function model = actport_roundproduct(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Product', block_path);
    set_param(block_path, 'Multiplication', 'Element-wise(.*)');
    set_param(block_path, 'Inputs', '**');
    %TODO: Handle overflow properly

    set_common_parameters(model, block_id, model_path);
end