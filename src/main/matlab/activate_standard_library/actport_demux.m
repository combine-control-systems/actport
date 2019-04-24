% activate = 'system/Routing/Demux'
function out = actport_demux(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Signal Routing/Demux');
    block = setParamExpr(block, 'Outputs', sprintf('%d', block.outputCount));

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end