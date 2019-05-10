% activate = 'system/SignalGenerators/Constant'
function model = actport_constant(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sources/Constant', block_path);

    value = get_parameter(model, block_id, 'C', '1');
    set_param(block_path, 'Value', value);
    % Ensure that signals keep their dimensions.
    set_param(block_path, 'VectorParams1D', 'off');

    set_common_parameters(model, block_id, model_path);
end
