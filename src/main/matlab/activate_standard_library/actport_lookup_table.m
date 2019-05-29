% activate = 'system/LookupTables/LookupTable'
function model = actport_lookup_table(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Lookup Tables/1-D Lookup Table', block_path);

    x = get_parameter(model, block_id, 'xx', '[-1,1]');
    y = get_parameter(model, block_id, 'yy', '[-1,1]');

    set_param(block_path, 'Table', y);
    set_param(block_path, 'BreakpointsForDimension1', x);

    method = strrep(get_parameter(model, block_id, 'Method', 'Linear'), '''', '');

    switch method
        case 'Linear'
            simulink_method = 'Linear point-slope';
        case 'Not_a_knot'
            simulink_method = 'Cubic spline';
        case 'Natural'
            % Second order derivatives at the end points of the interval should be zero.
            simulink_method = 'Cubic spline';
            logger('Simulink does not support Natural interpolation - falling back to Cubic Spline', block_path);
        case 'Clamped'
            simulink_method = 'Cubic spline';
            % First order derivatives at the end points of the interval should be zero.
            logger('Simulink does not support Clamped interpolation - falling back to Cubic Spline', block_path);
        case 'ZeroOrder(floor)'
            % TODO: Lookup Table Dynamic seems to support this.
            simulink_method = 'Flat';
            logger('Simulink does not support ZeroOrder(floor) interpolation - falling back to Nearest', block_path);
        case 'ZeroOrder(ceil)'
            % TODO: Lookup Table Dynamic seems to support this.
            simulink_method = 'Nearest';
            logger('Simulink does not support ZeroOrder(ceil) interpolation - falling back to Nearest', block_path);
        case 'ZeroOrder(nearest)'
            simulink_method = 'Nearest';
        otherwise
            logger(sprintf('Unknown interpolation method %s - falling back to Linear', method), block_path);
            simulink_method = 'Linear';
    end
    set_param(block_path, 'InterpMethod', simulink_method);

    extrapolation_left = strrep(get_parameter(model, block_id, 'Leftside', 'Hold'), '''', '');
    extrapolation_right = strrep(get_parameter(model, block_id, 'Rightside', 'Hold'), '''', '');
    if ~strcmp(extrapolation_left, extrapolation_right)
        logger(sprintf(['Simulink interpolation block does not support different extrapolation on ' ...
            'each side - using right side.']), block_path);
    end
    switch extrapolation_right
        case 'Zero'
            logger('Simulink does not support Zero extrapolation - falling back to Clip', block_path);
            simulink_extrapolation = 'Clip';
        case 'Hold'
            simulink_extrapolation = 'Clip';
        case 'Extrapolation'
            simulink_extrapolation = 'Linear';
        case 'Repeat'
            logger('Simulink does not support Repeat extrapolation - falling back to Clip', block_path);
            simulink_extrapolation = 'Clip';
        otherwise
            logger(sprintf('Unknown extrpolation method %s - falling back to Bilinear Extrapolation', method), ...
                block_path);
            simulink_extrapolation = 'Linear';
    end
    set_param(block_path, 'ExtrapMethod', simulink_extrapolation);

    set_common_parameters(model, block_id, model_path);
end
