% activate = 'system/MathOperations/MaxMin'
function out = actport_maxmin(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/MinMax');
    block = setParamExpr(block, 'Function', lower(getParameter(block, 'mm', 'Max')));
    block = setParamExpr(block, 'Inputs', getParameter(block, 'nin', '2'));

    zcross = strcmp(getParameter(block, 'zc', '0'), '0');
    if zcross
        block = setParamExpr(block, 'ZeroCross', 'off');
    else
        block = setParamExpr(block, 'ZeroCross', 'on');
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
