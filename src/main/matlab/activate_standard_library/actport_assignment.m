% activate = 'system/MatrixOperations/Assignment'
function model = actport_assignment(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    mode_x_select_all = strcmp(char(get_parameter(model, block_id, 'assignx/x_selectall', '1')), '1');
    mode_x_vector_index = strcmp(char(get_parameter(model, block_id, 'assignx/x_vectorindex', '0')), '1');
    mode_x_starting_index = strcmp(char(get_parameter(model, block_id, 'assignx/x_startingindex', '0')), '1');
    mode_x_starting_index_decreasing = strcmp(char(get_parameter(model, block_id, 'assignx/x_startingindexdecreasing', '0')), '1');
    mode_x_vector_index_port = strcmp(char(get_parameter(model, block_id, 'assignx/x_vectorindexport', '0')), '1');
    mode_x_starting_index_port = strcmp(char(get_parameter(model, block_id, 'assignx/x_startingindexport', '0')), '1');
    mode_x_starting_index_port_decreasing = strcmp(char(get_parameter(model, block_id, 'assignx/x_startingindexportdecreasing', '0')), '1');

    x_port_active = mode_x_vector_index_port || mode_x_starting_index_port || mode_x_starting_index_port_decreasing;

    x_vector_index = char(get_parameter(model, block_id, 'x_vector_index/x_vi', '1'));
    x_starting_index = char(get_parameter(model, block_id, 'x_starting_index/x_si', '1'));
    x_starting_index_port_decreasing = char(get_parameter(model, block_id, 'x_starting_index_portdecreasing/x_si', '1'));

    mode_y_select_all = strcmp(char(get_parameter(model, block_id, 'assigny/y_selectall', '1')), '1');
    mode_y_vector_index = strcmp(char(get_parameter(model, block_id, 'assigny/y_vectorindex', '0')), '1');
    mode_y_starting_index = strcmp(char(get_parameter(model, block_id, 'assigny/y_startingindex', '0')), '1');
    mode_y_starting_index_decreasing = strcmp(char(get_parameter(model, block_id, 'assigny/y_startingindexdecreasing', '0')), '1');
    mode_y_vector_index_port = strcmp(char(get_parameter(model, block_id, 'assigny/y_vectorindexport', '0')), '1');
    mode_y_starting_index_port = strcmp(char(get_parameter(model, block_id, 'assigny/y_startingindexport', '0')), '1');
    mode_y_starting_index_port_decreasing = strcmp(char(get_parameter(model, block_id, 'assigny/y_startingindexportdecreasing', '0')), '1');

    y_port_active = mode_y_vector_index_port || mode_y_starting_index_port || mode_y_starting_index_port_decreasing;

    y_vector_index = char(get_parameter(model, block_id, 'y_vector_index/y_vi', '1'));
    y_starting_index = char(get_parameter(model, block_id, 'y_starting_index/y_si', '1'));
    y_starting_index_port_decreasing = char(get_parameter(model, block_id, 'y_starting_index_portdecreasing/y_si', '1'));

    % TODO: Handle decreasing modes.

    modes = {'Assign all', 'Assign all'};
    indices = {'[1,2]', '[1,2]'};

    if mode_x_vector_index
        modes{1} = 'Index vector (dialog)';
        indices{1} = x_vector_index;
    elseif mode_x_starting_index
        modes{1} = 'Starting index (dialog)';
        indices{1} = x_starting_index;
    elseif mode_x_vector_index_port
        modes{1} = 'Index vector (port)';
    elseif mode_x_starting_index_port
        modes{1} = 'Starting index (port)';
    else
        logger('Decreasing index mode not supported for I.', block_path);
    end

    if mode_y_vector_index
        modes{2} = 'Index vector (dialog)';
        indices{2} = y_vector_index;
    elseif mode_y_starting_index
        modes{2} = 'Starting index (dialog)';
        indices{2} = y_starting_index;
    elseif mode_y_vector_index_port
        modes{2} = 'Index vector (port)';
    elseif mode_y_starting_index_port
        modes{2} = 'Starting index (port)';
    else
        logger('Decreasing index mode not supported for J.', block_path);
    end

    add_block('simulink/Math Operations/Assignment', block_path);

    onebased = strcmp(char(get_parameter(model, block_id, 'onebased', '1')), '1');
    if onebased
        set_param(block_path, 'IndexMode', 'One-based');
    else
        set_param(block_path, 'IndexMode', 'Zero-based');
    end

    set_param(block_path, ...
        'IndexOptionArray', modes, ...
        'IndexParamArray', indices, ...
        'NumberOfDimensions', '2');

    set_common_parameters(model, block_id, model_path);
end
