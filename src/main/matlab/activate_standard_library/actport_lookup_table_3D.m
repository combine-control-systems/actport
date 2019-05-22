% activate = 'system/LookupTables/LookupTable3D'
function model = actport_lookup_table_3D(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Lookup Tables/n-D Lookup Table', block_path);

    x = get_parameter(model, block_id, 'xx', '[-1, 1]');
    y = get_parameter(model, block_id, 'yy', '[-1, 1]');
    z = get_parameter(model, block_id, 'zz', '[-1, 1]');
    f = get_parameter(model, block_id, 'ff', '[-1, 1, -1, 1, -1, 1, -1, 1]');

    xs = length(eval(x));
    ys = length(eval(y));
    zs = length(eval(z));
    f = sprintf('reshape(%s, %d, %d, %d)', f, xs, ys, zs);

    set_param(block_path, 'NumberOfTableDimensions', '3');
    set_param(block_path, 'BreakpointsForDimension1', x);
    set_param(block_path, 'BreakpointsForDimension2', y);
    set_param(block_path, 'BreakpointsForDimension3', z);
    set_param(block_path, 'Table', f);

    interpolation = strrep(get_parameter(model, block_id, 'Method', ''), '''', '');
    switch interpolation
        case 'Trilinear interpolation'
            simulink_interpolation = 'Linear'
        case 'Nearest_point'
            simulink_interpolation = 'Nearest'
        case 'Point_just_below'
            simulink_interpolation = 'Nearest'
            logger('Simulink does not support Point just below interpolation - falling back to Nearest.', block_path);
        case 'Point_just_above'
            simulink_interpolation = 'Nearest'
            logger('Simulink does not support Point just above interpolation - falling back to Nearest.', block_path);
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
        case 'Bilinear extrapolation'
            simulink_extrapolation = 'Linear';
        otherwise
            logger(sprintf('Unknown extrapolation method %s - falling back to Linear Extrapolation', method), ...
                block_path);
            simulink_extrapolation = 'Linear';
    end
    set_param(block_path, 'ExtrapMethod', simulink_extrapolation);

    set_common_parameters(model, block_id, model_path);
end
