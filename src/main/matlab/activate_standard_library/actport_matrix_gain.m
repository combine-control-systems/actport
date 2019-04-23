% activate = 'system/MatrixOperations/MatrixGain'
function out = actport_matrix_gain(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Gain');
    block = setParamExpr(block, 'Gain', getParameter(block, 'gain', '1.0'));

    switch getParameter(block, 'overflow', '''Nothing''')
        case '''Saturate'''
            block = setParamExpr(block, 'SaturateOnIntegerOverflow', 'on');
        case '''Nothing'''
            block = setParamExpr(block, 'SaturateOnIntegerOverflow', 'off');
        % TODO: Handle "Error" case properly.
        case '''Error'''
            block = setParamExpr(block, 'SaturateOnIntegerOverflow', 'off');
        otherwise
            block = setParamExpr(block, 'SaturateOnIntegerOverflow', 'off');
    end

    switch getParameter(block, 'mulmethod', '''Gain*u1''')
        case '''Gain.*u1'''
            block = setParamExpr(block, 'Multiplication', 'Element-wise(K.*u)');
        case '''Gain*u1'''
            block = setParamExpr(block, 'Multiplication', 'Matrix(K*u)');
        case '''u1*Gain'''
            block = setParamExpr(block, 'Multiplication', 'Matrix(u*K)');
        otherwise
            block = setParamExpr(block, 'Multiplication', 'Matrix(K*u)');
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
