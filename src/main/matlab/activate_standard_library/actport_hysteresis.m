% activate = 'system/Hybrid/Hysteresis'
function model = actport_hysteresis(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discontinuities/Relay', block_path);

    high_lim = char(get_parameter(model, block_id, 'high_lim', '1'));
    low_lim = char(get_parameter(model, block_id, 'low_lim', '0'));
    out_high = char(get_parameter(model, block_id, 'out_high', '1'));
    out_low = char(get_parameter(model, block_id, 'out_low', '0'));

    % TODO: The Simulink Relay block does not support selecting the initial state output.
    %init_out = char(get_parameter(model, block_id, 'init_out'), '0');

    set_param(block_path, 'OnSwitchValue', high_lim);
    set_param(block_path, 'OffSwitchValue', low_lim);
    set_param(block_path, 'OnOutputValue', out_high);
    set_param(block_path, 'OffOutputValue', out_low);

    set_common_parameters(model, block_id, model_path);
end
