% activate = 'system/MathOperations/Sum'
function out = actport_sum(diagram, block, blockName)
    import actport.GeneratorApi.*

    block = addExpression(block, addBlock('simulink/Math Operations/Add', blockName));

    signs = getParameter(block, 'in_ports/sgn', {'+', '+'});

    inputs = '';
    for i = 1:length(signs)
        inputs = strcat(inputs, strrep(string(signs(i)), '''', ''));
    end

    block = addExpression(block, setParam(blockName, 'Inputs', inputs));

    block = addCommonProperties(block, blockName);
    out = updateDiagram(diagram, block, blockName);
end
