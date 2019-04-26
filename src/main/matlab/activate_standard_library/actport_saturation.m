% activate = 'system/Hybrid/Saturation'
function out = actport_saturation(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Discontinuities/Saturation');
    block = setParamExpr(block, 'UpperLimit', getParameter(block, 'upper', '1'));
    block = setParamExpr(block, 'LowerLimit', getParameter(block, 'lower', '-1'));

    zcross = strcmp(getParameter(block, 'zc', '0'), '0');
    if zcross
        block = setParamExpr(block, 'ZeroCross', 'off');
    else
        block = setParamExpr(block, 'ZeroCross', 'on');
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
