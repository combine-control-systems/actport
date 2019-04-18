% activate = 'system/Dynamical/Integral'
function out = activate_integrator(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Continuous/Integrator');

    x0 = getParameter(block, 'x0', '0');
    block = setParamExpr(block, 'InitialCondition', x0);

    reinit = getParameter(block, 'reinit', '1');
    if reinit == '1'
        reinit = 'external';
    else
        reinit = 'internal';
    end
    block = setParamExpr(block, 'InitialConditionSource', reinit);

    satur = getParameter(block, 'satur', '1');
    if satur == '1'
        satur = 'on';
    else
        satur = 'off';
    end
    block = setParamExpr(block, 'LimitOutput', satur);

    maxLimit = getParameter(block, 'limit/max', 'inf');
    block = setParamExpr(block, 'UpperSaturationLimit', maxLimit);

    minLimit = getParameter(block, 'limit/min', '-inf');
    block = setParamExpr(block, 'LowerSaturationLimit', minLimit);

    zcross = getParameter(block, 'zcross', 'off');
    block = setParamExpr(block, 'ZeroCross', zcross);

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
