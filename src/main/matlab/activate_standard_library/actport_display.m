% activate = 'system/SignalViewers/Display'
function model = actport_display(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sinks/Display', block_path);

    % TODO: Parse format string and translate to closest Simulink equivalent among the values
    %       'short' | 'long' | 'short_e' | 'long_e' | 'bank' | 'hex (Stored Integer)' |
    %       'binary (Stored Integer)' | 'decimal (Stored Integer)' | 'octal (Stored Integer)'
    format = get_parameter(model, block_id, 'Format', 'short');
    set_param(block_path, 'Format', 'short');


    % TODO: "dt" (Activate) and "decimation" (Simulink) are not equivalent. "dt" is given in seconds
    %       and "decimation" is given as every n:th sample.
    set_param(block_path, 'Decimation', '1');

    set_common_parameters(model, block_id, model_path);
end
