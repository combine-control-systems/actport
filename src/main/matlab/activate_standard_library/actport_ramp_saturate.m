% activate = 'system/SignalGenerators/RampSaturate'
function model = actport_ramp_saturate(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    % Simulink does not suport ramp saturation, so a saturation block will be used instead
    add_clean_subsystem(block_path);

    h = get_parameter(model, block_id, 'height', '1');
    t = get_parameter(model, block_id, 'duration', '1');
    start = get_parameter(model, block_id, 'startTime', '0');

    slope = num2str(str2double(h) / str2double(t));
    low = get_parameter(model, block_id, 'offset', '0.0');
    upp = num2str(str2double(low) + str2double(h));

    % Ramp block
    ramp_path = sprintf('%s/Ramp', block_path);
    add_block('simulink/Sources/Ramp', ramp_path);
    set_param(ramp_path, 'slope', slope);
    set_param(ramp_path, 'start', start);
    set_param(ramp_path, 'InitialOutput', '0');

    % Saturation block
    sat_path = sprintf('%s/Saturation', block_path);
    add_block('simulink/Discontinuities/Saturation', sat_path);
    set_param(sat_path, 'UpperLimit', upp);
    set_param(sat_path, 'LowerLimit', low);
    set_param(sat_path, 'ZeroCross', 'off');

    % Routing and output
    add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block_path));
    add_line(block_path, 'Ramp/1', 'Saturation/1');
    add_line(block_path, 'Saturation/1', 'Out1/1');

    % Rearrange the blocks in the subsystem.
    Simulink.BlockDiagram.arrangeSystem(block_path);

    set_common_parameters(model, block_id, model_path);
end