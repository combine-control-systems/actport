% activate = 'system/MathOperations/Log'
function out = actport_log(diagram, block)
    import actport.GeneratorApi.*

    base = getParameter(block, 'base', 'exp(1)');
    if strcmp(base, 'exp(1)')
        block = addBlockExpr(block, 'simulink/Math Operations/Math Func');
        block = setParamExrp(block, 'Operator', 'log');
    else
        % There isn't a block in Simulink able to select the base; use subblock and constant
        block = addCleanSubSystemExpr(block);

        % There is no log(base)(value) available, so we calculate using log(u)/log(v)
        block = addBlockExpr(block, 'simulink/User-Defined Functions/MATLAB Function', sprintf('%s/Log', block.name));
        block = setMatlabFunctionScriptExpr(block, sprintf([...
            'function x = f(u, v)\n'...
            %#codegen\n'...
            'x = log(u)/log(v);'...
            'end\n'...
            ]));
        % Add output port.
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block.name));
        % Connect log block and output port.
        block = addLineExpr(block, block.name, 'Log/1', 'Out1/1');
        % Add input port and connect to log block
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/In1', sprintf('%s/In1', block.name));
        block = addLineExpr(block, block.name, 'In1/1', 'Log/1');
        % Add constant block and connect to log block
        block = addBlockExpr(block, 'simulink/Sources/Constant', sprintf('%s/Base', block.name));
        block = setParamExpr(block, sprintf('%s/Base', block.name), 'Value', base);
        block = setLineExpr(block, block.name, 'Base/1', 'Log/2');
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
