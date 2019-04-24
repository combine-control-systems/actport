% activate = 'system/Ports/Input'
function out = actport_inputport(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Ports & Subsystems/In1');
    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
