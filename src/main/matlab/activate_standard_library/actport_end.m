% activate = 'system/ActivationOperations/End'
function model = actport_end(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sinks/Stop Simulation', block_path);

    set_common_parameters(model, block_id, model_path);
end
