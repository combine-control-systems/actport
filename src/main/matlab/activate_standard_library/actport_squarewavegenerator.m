% activate = 'system/SignalGenerators/SquareWaveGenerator'
function out = actport_product(diagram, block)
    import actport.GeneratorApi.*

    first = getParameter(block, 'FV', '1');
    second = getParameter(block, 'SV', '-1');
    amplitude = num2str(str2num(first) - str2num(second));
    % Symulink does only define Amplitude, but not second value. It requires to sum a constant to the output
    block = addCleanSubSystemExpr(block);

    block = addBlockExpr(block, 'simulink/Sources/Pulse Generator', sprintf('%s/Generator', block.name));
    block = setParamExpr(block, sprintf('%s/Generator', block.name), 'Amplitude', amplitude);
    block = setParamExpr(block, sprintf('%s/Generator', block.name), 'Period', getParameter(block, 'period', '1'));
    block = setParamExpr(block, sprintf('%s/Generator', block.name), 'PulseWidth', getParameter(block, 'dutyCycle', '1'));
    block = setParamExpr(block, sprintf('%s/Generator', block.name), 'PhaseDelay', getParameter(block, 'offset', '1'));

    % Constant block
    block = addBlockExpr(block, 'simulink/Sources/Constant', sprintf('%s/Const', block.name));
    block = setParamExpr(block, sprintf('%s/Const', block.name), 'Value', second);

    % Sum the Constant and Pulse Generator
    block = addBlockExpr(block, 'simulink/Math Operations/Add', sprintf('%s/Sum', block.name));
    block = setParamExpr(block, sprintf('%s/Sum', block.name), 'Inputs', '++');

    % Ouput line
    block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block.name));

    % Route Sum to output and Generators to Sum
    block = addLineExpr(block, block.name, 'Sum/1', 'Out1/1');
    block = addLineExpr(block, block.name, 'Const/1', 'Sum/1');
    block = addLineExpr(block, block.name, 'Generator/1', 'Sum/2');

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end