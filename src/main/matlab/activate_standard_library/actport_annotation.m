% activate = 'TEXT_f'
function model = actport_annotation(model, block_id, model_path)
    import actport.model.Matlab.*

    text = get_parameter(model, block_id, 'txt', 'No text...');
    block_path = sprintf('%s/%s', model_path, text);

    add_block('built-in/Area', block_path, 'Position', str2num(get_position(model, block_id)));
end
