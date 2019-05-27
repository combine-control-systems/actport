% activate = 'system/ActivationOperations/EventDelay'
function model = actport_event_delay(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Continuous/Transport Delay', block_path);
    set_param(block_path, 'DelayTime', get_parameter(model, block_id, 'delay', '1'));
    set_param(block_path, 'InitialOutput', get_parameter(model, block_id, 'init', '0'));
    set_param(block_path, 'BufferSize', get_parameter(model, block_id, 'N', '1000'));

    model = swap_width_and_height(model, block_id);
    model = rotate_clockwise(model, block_id);

    set_common_parameters(model, block_id, model_path);
end
