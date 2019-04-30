% activate = 'system/MatrixOperations/MatrixExtractor'
function out = actport_matrix_extractor(system, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Signal Routing/Selector');
    % When 1, matrix indices start with 1, otherwise 0.
    if getParameter(block, 'onebased', '1')
        block = setParamExpr(block, 'IndexMode', 'One-based');
    else
        block = setParamExpr(block, 'IndexMode', 'Zero-based');
    end

    [xMode, xIndex, xSize] = parseDimension(block, 'x');
    [yMode, yIndex, ySize] = parseDimension(block, 'y');

    block = setParamExpr(block, {'NumberOfDimensions', '''2''', ...
        'IndexOptionArray', sprintf('{''%s'', ''%s''}', xMode, yMode), ...
        'IndexParamArray', sprintf('{''%s'', ''%s''}', xIndex, yIndex), ...
        'OutputSizeArray', sprintf('{''%s'', ''%s''}', xSize, ySize)}, ...
        false);  % Turn off automatic quotation and escaping of quotes for strings.

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end

function [mode, index, size] = parseDimension(block, dimension)
    import actport.GeneratorApi.*

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
    mode = struct('mode', 'Select all');
    index = 1;
    size = 1;
    % Defined as parameter - select rows by specified indices.
    % Possible values: 0, 1.
    if strcmp(getParameter(block, sprintf('extract%c/%c_vectorindex', dimension, dimension), '0'), '1')
        mode = 'Index vector (dialog)';
        index = char(getParameter(block, sprintf('%c_vector_index/%c_vi', dimension, dimension), '1'));
    end
    if strcmp(getParameter(block, sprintf('extract%c/%c_startingindex', dimension, dimension), '0'), '1')
        mode = 'Starting index (dialog)';
        index = char(getParameter(block, sprintf('%c_starting_index/%c_si', dimension, dimension), '1'));
        size = char(getParameter(block, sprintf('%c_starting_index/%c_osz', dimension, dimension), '1'));
    end
    if strcmp(getParameter(block, sprintf('extract%c/%c_startingindexdecreasing', dimension, dimension), '0'), '1')
        mode = 'Starting index (dialog)';
        error('Not implemented yet.');
        % Reverse the indices.
    end
    if strcmp(getParameter(block, sprintf('extract%c/%c_vectorindexport', dimension, dimension), '0'), '1')
        mode = 'Starting index (port)';
        error('Not implemented yet.');
    end
    if strcmp(getParameter(block, sprintf('extract%c/%c_startingindexportdecreasing', dimension, dimension), '0'), '1')
        mode = 'Starting index (port)';
        error('Not implemented yet.');
        % Reverse the indices somehow?
    end
end
