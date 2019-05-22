% activate = 'system/LookupTables/LookupTableND'
function model = actport_lookup_table_ND(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Lookup Tables/n-D Lookup Table', block_path);

    nDims = eval(get_parameter(model, block_id, 'nDims', '1'));
    dims = get_parameter(model, block_id, 'dims/dimi', '{''[-1, 1]''}');

    set_param(block_path, 'NumberOfTableDimensions', num2str(nDims));
    for i = 1:nDims
        dim = char(dims(i));
        set_param(block_path, sprintf('BreakpointsForDimension%d', i), dim);
    end

    f = get_parameter(model, block_id, 'ff', '[-1, 1]');
    s = ['reshape(', f];
    for i = 1:nDims
        s = [s, sprintf(', %d', length(eval(dims(i))))];
    end
    s = [s, ')'];
    set_param(block_path, 'Table', s);

    interpolation = strrep(get_parameter(model, block_id, 'Method', ''), '''', '');
    switch interpolation
        case 'Hold'
            simulink_interpolation = 'Linear'
        case 'Nearest'
            simulink_interpolation = 'Nearest'
        case 'Linear'
            simulink_interpolation = 'Nearest'
            logger('Simulink does not support Point just below interpolation - falling back to Nearest.', block_path);
        case 'Akima'
            simulink_interpolation = 'Cubic spline'
            logger('Simulink does not support Akima interpolation - falling back to Cubic spline.', block_path);
        case 'Fritsch_Butland'
            simulink_interpolation = 'Cubic spline'
            logger('Simulink does not support Fritsch Butland interpolation - falling back to Cubic spline.', block_path);
        case 'Steffen'
            simulink_interpolation = 'Cubic spline'
            logger('Simulink does not support Steffen interpolation - falling back to Nearest.', block_path);
        otherwise
            simulink_interpolation = 'Linear';
            logger(sprintf('Unknown interpolation method %s - falling back to Linear.', method), block_path);
    end
    set_param(block_path, 'InterpMethod', simulink_interpolation);

    extrapolation = strrep(get_parameter(model, block_id, 'DoOutside', 'Hold'), '''', '');
    switch extrapolation
        case 'Zero'
            logger('Simulink does not support Zero extrapolation - falling back to Clip', block_path);
            simulink_extrapolation = 'Clip';
        case 'Hold'
            simulink_extrapolation = 'Clip';
        case 'Linear'
            simulink_extrapolation = 'Linear';
        case 'Error'
            simulink_extrapolation = 'Clip';
            set_param(block_path, 'DiagnosticForOutOfRangeInput', 'Error');
        otherwise
            logger(sprintf('Unknown extrapolation method %s - falling back to Linear Extrapolation', method), ...
                block_path);
            simulink_extrapolation = 'Linear';
    end
    set_param(block_path, 'ExtrapMethod', simulink_extrapolation);

    set_common_parameters(model, block_id, model_path);
end
