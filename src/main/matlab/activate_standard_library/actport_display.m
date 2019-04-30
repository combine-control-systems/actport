% activate = 'system/SignalViewers/Display'
function out = actport_display(system, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Sinks/Display');
    % TODO: Parse format string and translate to closest Simulink equivalent among the values
    %       'short' | 'long' | 'short_e' | 'long_e' | 'bank' | 'hex (Stored Integer)' |
    %       'binary (Stored Integer)' | 'decimal (Stored Integer)' | 'octal (Stored Integer)'
    block = setParamExpr(block, 'Format', 'short');
    % TODO: "dt" (Activate) and "decimation" (Simulink) are not equivalent. "dt" is given in seconds
    %       and "decimation" is given as every n:th sample.
    block = setParamExpr(block, 'Decimation', '1');

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
