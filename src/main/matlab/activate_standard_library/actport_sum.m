% activate = 'system/MathOperations/Sum'
function out = actport_sum(system, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Add');

    signs = getParameter(block, 'in_ports/sgn', {'+', '+'});

    inputs = '';
    for i = 1:length(signs)
        inputs = strcat(inputs, strrep(string(signs(i)), '''', ''));
    end

    block = setParamExpr(block, 'Inputs', inputs);

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
