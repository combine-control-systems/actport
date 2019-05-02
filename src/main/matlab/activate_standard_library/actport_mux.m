% activate = 'system/Routing/Mux'
function model = actport_mux(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Signal Routing/Mux', block_path);

    inputs = get_input_count(model, block_id);
    set_param(block_path, 'Inputs', sprintf('%d', inputs));

    set_common_parameters(model, block_id, model_path);
end
