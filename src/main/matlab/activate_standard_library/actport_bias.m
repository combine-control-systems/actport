% activate = 'system/MathOperations/Bias'
function model = actport_bias(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Bias', block_path);

    set_param(block_path, 'Bias', get_parameter(model, block_id, 'Bias', '0.0'));
    %TODO: Handle overflow properly

    set_common_parameters(model, block_id, model_path);
end
