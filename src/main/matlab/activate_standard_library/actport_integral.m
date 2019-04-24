% activate = 'system/Dynamical/Integral'
function out = actport_integral(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Continuous/Integrator');
    block = setParamExpr(block, 'InitialCondition', getParameter(block, 'x0', '0'));

    % TODO: Also set how the external signal re-initializes the integrator (see "ExternalReset").
    if strcmp(getParameter(block, 'reinit', '0'), '1')
        block = setParamExpr(block, 'InitialConditionSource', 'on');
    else
        block = setParamExpr(block, 'InitialConditionSource', 'off');
    end

    if strcmp(getParameter(block, 'satur', '0'), '1')
        block = setParamExpr(block, 'LimitOutput', 'on');
    else
        block = setParamExpr(block, 'LimitOutput', 'off');
    end

    block = setParamExpr(block, 'UpperSaturationLimit', getParameter(block, 'max', 'inf'));
    block = setParamExpr(block, 'LowerSaturationLimit', getParameter(block, 'min', '-inf'));
    block = setParamExpr(block, 'ZeroCross', getParameter(block, 'zcross', 'off'));

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
