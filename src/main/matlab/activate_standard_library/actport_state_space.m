% activate = 'system/Dynamical/ContStateSpace'
function out = actport_state_space(system, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Continuous/State-Space');
    block = setParamExpr(block, 'A', getParameter(block, 'A', '1'));
    block = setParamExpr(block, 'B', getParameter(block, 'B', '1'));
    block = setParamExpr(block, 'C', getParameter(block, 'C', '1'));
    block = setParamExpr(block, 'D', getParameter(block, 'D', '1'));
    block = setParamExpr(block, 'X0', getParameter(block, 'x0', '0'));

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
