% activate = 'system/Ports/Output'
function out = actport_outputport(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1');
    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
