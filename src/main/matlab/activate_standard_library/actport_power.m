% activate = 'system/MathOperations/Power'
function out = actport_power(diagram, block)
    import actport.GeneratorApi.*

    exponent = getParameter(block, 'power', '3');
    % There isn't a block in Simulink able to select the power; use subblock and constant
    block = addCleanSubSystemExpr(block);

    block = addBlockExpr(block, 'simulink/Math Operations/Math Func', sprintf('%s/Power', block.name));
    block = setParamExpr(block, sprintf('%s/Power', block.name), 'Operator', 'pow');
    % Add output port.
    block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block.name));
    % Connect power block and output port.
    block = addLineExpr(block, block.name, 'Power/1', 'Out1/1');
    % Add input port and connect to power block
    block = addBlockExpr(block, 'simulink/Ports & Subsystems/In1', sprintf('%s/In1', block.name));
    block = addLineExpr(block, block.name, 'In1/1', 'Power/1');
    % Add constant block and connect to power block
    block = addBlockExpr(block, 'simulink/Sources/Constant', sprintf('%s/Exponent', block.name));
    block = setParamExpr(block, sprintf('%s/Exponent', block.name), 'Value', exponent);
    block = setLineExpr(block, block.name, 'Exponent/1', 'Power/2');

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
