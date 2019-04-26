% activate = 'system/MathOperations/Sign'
function out = actport_sign(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Sign');

    zcross = strcmp(getParameter(block, 'nzc', '0'), '0');
    if zcross
        block = setParamExpr(block, 'ZeroCross', 'off');
    else
        block = setParamExpr(block, 'ZeroCross', 'on');
    end
    %TODO: Handle overflow properly

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
