% activate = 'system/Hybrid/ControlledSaturation'
function model = actport_controlled_saturation(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discontinuities/Saturation Dynamic', block_path);
    model = map_input_port(model, block_id, 1, '3');
    model = map_input_port(model, block_id, 3, '1');

    set_common_parameters(model, block_id, model_path);
end
