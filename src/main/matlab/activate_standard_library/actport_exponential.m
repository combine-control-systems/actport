% activate = 'system/MathOperations/Exponential'
function out = actport_exponential(diagram, block)
    import actport.GeneratorApi.*

    base = getParameter(block, 'base', 'exp(1)');
    if strcmp(base, 'exp(1)')
        block = addBlockExpr(block, 'simulink/Math Operations/Math Func');
        block = setParamExrp(block, 'Operator', 'exp');
    else
        % There isn't a block in Simulink able to select the base; use subblock and constant
        block = addCleanSubSystemExpr(block);

        block = addBlockExpr(block, 'simulink/Math Operations/Math Func', sprintf('%s/Power', block.name));
        block = setParamExpr(block, sprintf('%s/Power', block.name), 'Operator', 'pow');
        % Add output port.
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block.name));
        % Connect exponential block and output port.
        block = addLineExpr(block, block.name, 'Power/1', 'Out1/1');
        % Add constant block and connect to exponential block
        block = addBlockExpr(block, 'simulink/Sources/Constant', sprintf('%s/Base', block.name));
        block = setParamExpr(block, sprintf('%s/Base', block.name), 'Value', base);
        block = setLineExpr(block, block.name, 'Base/1', 'Power/1');
        % Add input port and connect to power block
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/In1', sprintf('%s/In1', block.name));
        block = addLineExpr(block, block.name, 'In1/1', 'Power/2');
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
