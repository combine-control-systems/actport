% activate = 'system/MathOperations/Product'
function out = actport_product(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Product');
    block = setParamExpr(block, 'Multiplication', 'Element-wise(.*)');

    ops = getParameter(block, 'in_ports/sgn', {'*', '*'});

    inputs = '';
    for i = 1:length(ops)
        inputs = strcat(inputs, strrep(string(ops(i)), '''', ''));
    end
    block = setParamExpr(block, 'Inputs', inputs);

    round = getParameter(block, 'rmethod', '''Floor''');
    switch round
        case '''Ceil'''
            round = 'Ceiling';
        case '''Int'''
            round = 'Zero';
        otherwise
            round = round(2:end-1);
    end
    block = setParamExpr(block, 'RndMeth', round);
    %TODO: Handle overflow properly

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end