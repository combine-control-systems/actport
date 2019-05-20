% activate = 'system/SignalProperties/Sink'
function model = actport_sink(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sinks/Terminator', block_path);

    set_common_parameters(model, block_id, model_path);
end
