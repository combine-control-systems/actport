% activate = 'system/Dynamical/DiscreteDelay'
function out = actport_discrete_delay(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Discrete/Unit Delay');
    block = setParamExpr(block, 'InitialCondition', getParameter(block, 'init_cond', '0'));

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
