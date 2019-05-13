% activate = 'system/MatrixOperations/MatrixExtractor'
function model = actport_matrix_extractor(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Signal Routing/Selector', block_path);
    % When 1, matrix indices start with 1, otherwise 0.
    if strcmp(get_parameter(model, block_id, 'onebased', '1'), '1')
        set_param(block_path, 'IndexMode', 'One-based');
    else
        set_param(block_path, 'IndexMode', 'Zero-based');
    end

    [xMode, xIndex, xSize] = parseDimension(model, block_id, 'x');
    [yMode, yIndex, ySize] = parseDimension(model, block_id, 'y');

    set_param(block_path, 'NumberOfDimensions', '2', ...
        'IndexOptionArray', {xMode, yMode}, ... %sprintf('[''%s'';''%s'']', xMode, yMode), ...
        'IndexParamArray', {xIndex, yIndex}, ...
        'OutputSizeArray', {num2str(xSize), num2str(ySize)});

    set_common_parameters(model, block_id, model_path);
end

function [mode, index, size] = parseDimension(model, block_id, dimension)
    import actport.model.Matlab.*

    % In Matlab our IndexOptionArray can have the following elements:
    % - 'Select all'                         / No further configuration is required. All elements are selected.
    % - 'Index vector (dialog)'              / Enabled the Index column. Enter the vector of indices of the elements.
    % - 'Index vector (port)'                / No further configuration is required. A port is exposed.
    % - 'Starting index (dialog)'            / Enabled the Index and Output Size columns. Enter the starting index
    %                                        / of the range of elements to select in the Index column and the number
    %                                        / of elements to select in the Output Size column.
    % - 'Starting index (port)'              / Enables the Output Size column. Enter the number of elements to be
    %                                        / selected in the Output Size column.
    % - 'Starting and ending indices (port)' / No further configuration is required. Variable size output signal.
    %                                        / New ports are exposed.

    % Default values.
    mode = 'Select all';
    index = '1';
    size = 1;
    % Defined as parameter - select rows by specified indices.
    % Possible values: 0, 1.
    if strcmp(get_parameter(model, block_id, sprintf('extract%c/%c_vectorindex', dimension, dimension), '0'), '1')
        mode = 'Index vector (dialog)';
        index = char(get_parameter(model, block_id, sprintf('%c_vector_index/%c_vi', dimension, dimension), '1'));
    end
    if strcmp(get_parameter(model, block_id, sprintf('extract%c/%c_startingindex', dimension, dimension), '0'), '1')
        mode = 'Starting index (dialog)';
        index = char(get_parameter(model, block_id, sprintf('%c_starting_index/%c_si', dimension, dimension), '1'));
        size = char(get_parameter(model, block_id, sprintf('%c_starting_index/%c_osz', dimension, dimension), '1'));
    end
    if strcmp(get_parameter(model, block_id, sprintf('extract%c/%c_startingindexdecreasing', dimension, dimension), '0'), '1')
        mode = 'Starting index (dialog)';
        error('Not implemented yet.');
        % Reverse the indices.
    end
    if strcmp(get_parameter(model, block_id, sprintf('extract%c/%c_vectorindexport', dimension, dimension), '0'), '1')
        mode = 'Starting index (port)';
        error('Not implemented yet.');
    end
    if strcmp(get_parameter(model, block_id, sprintf('extract%c/%c_startingindexportdecreasing', dimension, dimension), '0'), '1')
        mode = 'Starting index (port)';
        error('Not implemented yet.');
        % Reverse the indices somehow?
    end
end
