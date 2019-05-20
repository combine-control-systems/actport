% activate = 'system/MatrixOperations/SumElements'
function model = actport_sum_elements(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Sum of Elements', block_path);
    set_param(block_path, 'Inputs', '+');
    switch get_parameter(model, block_id, 'decomptyp', '''All''')
        case '''All'''
            set_param(block_path, 'CollapseMode', 'All dimensions');
        case '''Rows'''
            set_param(block_path, 'CollapseMode', 'Specified dimension');
            set_param(block_path, 'CollapseDim', '2');
        case '''Columns'''
            set_param(block_path, 'CollapseMode', 'Specified dimension');
            set_param(block_path, 'CollapseDim', '1');
        otherwise
            error('Unknown Sum along parameter');
    end

    switch get_parameter(model, block_id, 'overflow', '''Nothing''')
        case '''Saturate'''
            set_param(block_path, 'SaturateOnIntegerOverflow', 'on');
        case '''Nothing'''
            set_param(block_path, 'SaturateOnIntegerOverflow', 'off');
        % TODO: Handle "Error" case properly.
        case '''Error'''
            set_param(block_path, 'SaturateOnIntegerOverflow', 'off');
        otherwise
            set_param(block_path, 'SaturateOnIntegerOverflow', 'off');
    end

    if not(strcmp(get_parameter(model, block_id, 'externalActivation', '0'), '0'))
        warning("External activation is not implemented in Simulink");
    end

    set_common_parameters(model, block_id, model_path);
end
