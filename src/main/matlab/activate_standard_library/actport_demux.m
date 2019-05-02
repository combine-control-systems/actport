% activate = 'system/Routing/Demux'
function model = actport_demux(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Signal Routing/Demux', block_path);

    outputs = get_output_count(model, block_id);
    set_param(block_path, 'Outputs', sprintf('%d', outputs));

    set_common_parameters(model, block_id, model_path);
end
