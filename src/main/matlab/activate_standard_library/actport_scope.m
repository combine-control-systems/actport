% activate = 'system/SignalViewers/Scope'
function model = actport_scope(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sinks/Scope', block_path);
    set_param(block_path, 'NumInputPorts', sprintf('%d', get_input_count(model, block_id)));

    set_common_parameters(model, block_id, model_path);
end
