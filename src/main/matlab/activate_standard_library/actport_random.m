% activate = 'system/SignalGenerators/Random'
function out = actport_random(diagram, block)
    import actport.GeneratorApi.*

    block = addCleanSubSystemExpr(block, "Random");
    block = addBlockExpr(block, 'simulink/Ports & Subsystems/Trigger', sprintf('%s/Trigger', block.name));
    block = setParamExpr(block, sprintf('%s/Trigger', block.name), 'TriggerType', 'either');

    distribution = getParameter(block, 'distribution', '''Normal''');
    switch distribution
        case '''Normal'''
            block = addBlockExpr(block, 'simulink/Sources/Random Number', sprintf('%s/Random', block.name));
            block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1', sprintf('%s/Value', block.name));
            block = addLineExpr(block, block.name, 'Random/1', 'Value/1');
            % Mean value.
            block = setParamExpr(block, sprintf('%s/Random', block.name), 'Mean', getParameter(block, 'A', '0'));
            % Variance.
            block = setParamExpr(block, sprintf('%s/Random', block.name), 'Variance', getParameter(block, 'B', '1'));
        case '''Uniform'''
            block = addBlockExpr(block, 'simulink/Sources/Uniform Random Number', sprintf('%s/Random', block.name));
            block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1', sprintf('%s/Value', block.name));
            block = addLineExpr(block, block.name, 'Random/1', 'Value/1');
            % Lower value.
            block = setParamExpr(block, sprintf('%s/Random', block.name), 'Minimum', getParameter(block, 'A', '0'));
            % Range value.
            block = setParamExpr(block, sprintf('%s/Random', block.name), 'Maximum', getParameter(block, 'B', '1'));
        otherwise
            error(sprintf('Unknown distribution %s', distribution));
    end

    block = setParamExpr(block, sprintf('%s/Random', block.name), 'Seed', getParameter(block, 'seed', '0'));
    block = setParamExpr(block, sprintf('%s/Random', block.name), 'SampleTime', '-1');

    block = mapEventInputPort(block, 1, 'Trigger');

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
