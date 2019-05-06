% activate = 'system/ActivationOperations/SampleClock'
function model = actport_sample_clock(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    freq = string(get_parameter(model, block_id, 'frequ', '1.0'));
    if ~isstring(freq) && isvector(freq)
        % TODO: This will fail if we have variables in array.
        freq = eval(freq);
        freq = freq(1) / freq(2) * 10^freq(3);
        freq = mat2str(freq);
    end

    if strcmp(freq, '0')
        % Always active. Not sure how to handle this case.
        error('Always active not implemented in Sample Clock.');
    else if strcmp(freq, '-1')
        % Activated at Initial Time
        offset = string(get_parameter(model, block_id, 'offset', '0'));
        if ~isstring(offset) && isvector(offset)
            % TODO: This will fail if we have variables in array.
            offset = eval(offset);
            offset = offset(1) / offset(2) * 10^offset(3);
            offset = mat2str(offset);
        end
        add_block('simulink/Sources/Step', block_path);
        set_param(block_path, 'Time', offset);
    else
        % Other cases.
        add_block('simulink/Sources/Counter Limited', block_path);
        set_param(block_path, 'uplimit', '1');
        set_param(block_path, 'tsamp', freq);
    end

    model = swap_width_and_height(model, block_id);
    model = rotate_clockwise(model, block_id);

    set_common_parameters(model, block_id, model_path);
end
