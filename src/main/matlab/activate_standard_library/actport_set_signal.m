% activate = 'system/Routing/SetSignal'
function model = actport_set_signal(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Signal Routing/Goto', block_path);
    tag = strrep(get_parameter(model, block_id, 'tag', '''A'''), '''', '');
    set_param(block_path, 'GotoTag', tag);
    vis = strrep(get_parameter(model, block_id, 'tagvis', '''Local'''), '''', '');
    set_param(block_path, 'TagVisibility', lower(vis));

    set_common_parameters(model, block_id, model_path);
end
