function set_common_parameters(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);

    block_path = sprintf('%s/%s', model_path, name);

    background_color = get_background_color(model, block_id);
    set_param(block_path, 'BackgroundColor', char(background_color));

    foreground_color = get_foreground_color(model, block_id);
    set_param(block_path, 'ForegroundColor', char(foreground_color));

    position = get_position(model, block_id);
    set_param(block_path, 'Position', char(position));

    orientation = get_orientation(model, block_id);
    set_param(block_path, 'Orientation', char(orientation));

    sample_rate = char(get_sample_rate(model, block_id));
    if ~isempty(sample_rate)
        try
            set_param(block_path, 'SampleTime', sample_rate);
        catch e
            % Do nothing. Just catching if the block does not support SampleTime.
        end
    end
end
