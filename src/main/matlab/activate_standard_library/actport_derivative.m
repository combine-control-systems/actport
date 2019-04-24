% activate = 'system/Dynamical/Derivative'
function out = actport_derivative(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Continuous/Derivative');
    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
