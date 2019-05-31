% activate = 'system/Routing/Merge'
function model = actport_merge(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Signal Routing/Merge', block_path);

    set_common_parameters(model, block_id, model_path);
end
