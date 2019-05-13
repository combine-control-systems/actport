% activate = 'system/Hybrid/SampleHold'
function model = actport_sample_hold(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discrete/Zero-Order Hold', block_path);

    set_common_parameters(model, block_id, model_path);
end
