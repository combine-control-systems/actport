% activate = 'system/MatrixOperations/Transpose'
function out = actport_transpose(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
    switch getParameter(block, 'rule', '''transpose''')
        case '''Transpose'''
            block = setParamExpr(block, 'Operator', 'transpose');
        case '''Hermitian(Transpose-Conjugate)'''
            block = setParamExpr(block, 'Operator', 'hermitian');
        otherwise
            block = setParamExpr(block, 'Operator', 'transpose');
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
