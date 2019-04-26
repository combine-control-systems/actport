% activate = 'system/Hybrid/Saturation'
function out = actport_saturation(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Discontinuities/Saturation');


    zcross = strcmp(getParameter(block, 'zcross', '0'), '0');
    if zcross
        block = setParamExpr(block, 'ZeroCross', 'off');
    else
        block = setParamExpr(block, 'ZeroCross', 'on');
    end
    %TODO: Handle overflow properly

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
