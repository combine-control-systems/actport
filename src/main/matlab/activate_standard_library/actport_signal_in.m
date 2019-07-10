% activate = 'system/SignalImporters/SignalIn'
function model = actport_signal_in(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sources/From Workspace', block_path);

    % TODO: Default value is not supported.
    % TODO: Nout is not supported.
    % TODO: outports is not supported.
    % TODO: interpolation method is not supported.
    % TODO: behavior before the start of the time data span is not supported.

    varname = strrep(char(get_parameter(model, block_id, 'varnam', 'A')), '''', '');
    set_param(block_path, 'VariableName', varname);

    method = strrep(char(get_parameter(model, block_id, 'Method', 'Linear')), '''', '');
    switch method
        case 'ZeroOrder'
            set_param(block_path, 'Interpolate', 'off');
        otherwise
            set_param(block_path, 'Interpolate', 'on');
    end

    right_side = strrep(char(get_parameter(model, block_id, 'Rightside', 'Hold')), '''', '');
    switch right_side
        case 'Zero'
            set_param(block_path, 'OutputAfterFinalValue', 'Setting to zero');
        case 'Hold'
            set_param(block_path, 'OutputAfterFinalValue', 'Holding final value');
        case 'Extrapolation'
            set_param(block_path, 'OutputAfterFinalValue', 'Extrapolation');
        case 'Repeat'
            set_param(block_path, 'OutputAfterFinalValue', 'Cyclic repetition');
    end

    set_common_parameters(model, block_id, model_path);
end
