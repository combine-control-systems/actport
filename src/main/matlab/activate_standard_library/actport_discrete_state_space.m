% activate = 'system/Dynamical/DiscrStateSpace'
function out = actport_discrete_state_space(system, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Discrete/Discrete State-Space');
    block = setParamExpr(block, 'A', getParameter(block, 'A', '1'));
    block = setParamExpr(block, 'B', getParameter(block, 'B', '1'));
    block = setParamExpr(block, 'C', getParameter(block, 'C', '1'));
    block = setParamExpr(block, 'D', getParameter(block, 'D', '1'));
    block = setParamExpr(block, 'x0', getParameter(block, 'X0', '0'));

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
