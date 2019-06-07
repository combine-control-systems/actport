% activate = 'system/Routing/GetSignal'
function model = actport_get_signal(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Signal Routing/From', block_path);
    tag = strrep(get_parameter(model, block_id, 'tag', '''A'''), '''', '');
    set_param(block_path, 'GotoTag', tag);

    set_common_parameters(model, block_id, model_path);
end
