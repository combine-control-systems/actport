% activate = 'system/Dynamical/Integral'
function out = activate_integrator(diagram, block, blockName)
    import actport.GeneratorApi.*

    block = addExpression(block, addBlock('simulink/Continuous/Integrator', blockName));

    x0 = getParameter(block, 'x0', '0');
    block = addExpression(block, setParam(blockName, 'InitialCondition', x0));

    reinit = getParameter(block, 'reinit', '1');
    if reinit == '1'
        reinit = 'external';
    else
        reinit = 'internal';
    end
    block = addExpression(block, setParam(blockName, 'InitialConditionSource', reinit));

    satur = getParameter(block, 'satur', '1');
    if satur == '1'
        satur = 'on';
    else
        satur = 'off';
    end
    block = addExpression(block, setParam(blockName, 'LimitOutput', satur));

    maxLimit = getParameter(block, 'limit/max', 'inf');
    block = addExpression(block, setParam(blockName, 'UpperSaturationLimit', maxLimit));

    minLimit = getParameter(block, 'limit/min', '-inf');
    block = addExpression(block, setParam(blockName, 'LowerSaturationLimit', minLimit));

    zcross = getParameter(block, 'zcross', 'off');
    block = addExpression(block, setParam(blockName, 'ZeroCross', zcross));

    block = addCommonProperties(block, blockName);
    out = updateDiagram(diagram, block, blockName);
end
