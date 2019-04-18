% activate = 'system/SignalGenerators/Constant'
function out = actport_constant(diagram, block, blockName)
    import actport.GeneratorApi.*

    block = addExpressions(block, ...
        addBlock('simulink/Sources/Constant', blockName)
%        setParam(block.name, 'Value', block.getParameter('Value', '1')) ...
    );

    out = updateDiagram(diagram, block, blockName);
end
