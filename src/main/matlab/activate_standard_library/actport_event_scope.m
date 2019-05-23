% activate = 'system/SignalViewers/EventScope'
function model = actport_event_scope(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sinks/Scope', block_path);
    set_param(block_path, 'NumInputPorts', sprintf('%d', get_event_input_count(model, block_id)));

    model = swap_width_and_height(model, block_id);
    model = rotate_clockwise(model, block_id);

    set_common_parameters(model, block_id, model_path);
end
