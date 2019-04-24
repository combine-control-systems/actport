% activate = 'system/ActivationOperations/SampleClock'
function out = actport_sample_clock(diagram, block)
    import actport.GeneratorApi.*

    freq = string(getParameter(block, 'frequ', '1.0'));
    if ~isstring(freq) && isvector(freq)
        % TODO: This will fail if we have variables in array.
        freq = eval(freq);
        freq = freq(1) / freq(2) * 10^freq(3);
        freq = mat2str(freq);
    end

    if freq == '0'
        % Always active. Not sure how to handle this case.
        error('Always active not implemented in Sample Clock.');
    else if freq == '-1'
        % Activated at Initial Time
        offset = string(getParameter(block, 'offset', '0'));
        if ~isstring(offset) && isvector(offset)
            % TODO: This will fail if we have variables in array.
            offset = eval(offset);
            offset = offset(1) / offset(2) * 10^offset(3);
            offset = mat2str(offset);
        end
        block = addBlockExpr(block, 'simulink/Sources/Step');
        block = setParamExpr(block, 'Time', offset);
    else
        % Other cases.
        block = addBlockExpr(block, 'simulink/Sources/Counter Limited');
        block = setParamExpr(block, 'uplimit', '1');
        block = setParamExpr(block, 'tsamp', freq);
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
