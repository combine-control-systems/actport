% activate = 'system/SignalExporters/SignalOut'
function model = actport_signal_out(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sinks/To Workspace', block_path);

    % TODO: several settings not supported, R_MP, R_DE, R_MPLL, R_ZCLL, R_TRY

    varname = strrep(char(get_parameter(model, block_id, 'varnam', 'A')), '''', '');
    set_param(block_path, 'VariableName', varname);

    subsample = char(get_parameter(model, block_id, 'subsample', '1'));
    set_param(block_path, 'Decimation', subsample);

    buffsize = char(get_parameter(model, block_id, 'buffsize', 'Inf'));
    set_param(block_path, 'MaxDataPoints', buffsize);

    set_common_parameters(model, block_id, model_path);
end
