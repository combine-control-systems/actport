% activate = 'system/Routing/Mux'
function out = actport_mux(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Signal Routing/Mux');
    block = setParamExpr(block, 'Inputs', sprintf('%d', block.inputCount));

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
