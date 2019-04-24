% activate = 'system/MatrixOperations/MatrixConcatenation'
function out = actport_matrix_concatenation(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Matrix Concatenate');
    block = setParamExpr(block, 'NumInputs', getParameter(block, 'nin', '2'));
    block = setParamExpr(block, 'Mode', 'Multidimensional array');
    if strcmp(getParameter(block, 'method', '''Horizontal'''), '''Horizontal''')
        block = setParamExpr(block, 'ConcatenateDimension', '2');
    else
        block = setParamExpr(block, 'ConcatenateDimension', '1');
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
