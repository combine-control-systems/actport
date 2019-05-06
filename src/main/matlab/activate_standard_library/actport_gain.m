% activate = 'system/MathOperations/Gain'
function model = actport_gain(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Gain', block_path);

    gain = get_parameter(model, block_id, 'gain', '1');
    set_param(block_path, 'Gain', gain);

    set_common_parameters(model, block_id, model_path);
end
