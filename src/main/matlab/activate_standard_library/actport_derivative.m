% activate = 'system/Dynamical/Derivative'
function out = actport_derivative(system, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Continuous/Derivative');
    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
