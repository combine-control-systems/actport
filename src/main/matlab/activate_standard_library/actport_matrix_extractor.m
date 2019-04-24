% activate = 'system/MatrixOperations/MatrixExtractor'
function out = actport_matrix_extractor(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Signal Routing/Selector');
    % When 1, matrix indexes start with 1, otherwise 0
    if getParameter(block, 'onebased', '1')
        block = setParamExpr(block, 'IndexMode', 'One-based');
    else
        block = setParamExpr(block, 'IndexMode', 'Zero-based');
    end

    in_op = {};
    in_par = {};
    for i = ['x' 'y']
        vix = getParameter(block, sprintf('extract%c/%c_vectorindex', i, i), '1');
        if vix
            in_op{end+1} = 'Index vector (dialog)';
            index = getParameter(block, sprintf('%c_vector_index/%c_vi', i, i), '1');
            in_par{end+1} = index;
        end
    end
    block = setParamExpr(block, 'NumberOfDimensions', '2',...
                                'IndexOptionArray', in_op,...
                                'IndexParamArray', in_par);

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end