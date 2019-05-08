% activate = 'system/SignalGenerators/SquareWaveGenerator'
function model = actport_square_wave_generator(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    first = get_parameter(model, block_id, 'FV', '1');
    second = get_parameter(model, block_id, 'SV', '-1');
    amplitude = num2str(str2num(first) - str2num(second));
    % Simulink only does define Amplitude, but not second value. It requires to sum a constant to the output.
    add_clean_subsystem(block_path);

    pg_path = sprintf('%s/Generator', block_path);
    add_block('simulink/Sources/Pulse Generator', pg_path);
    set_param(pg_path, 'Amplitude', amplitude);
    set_param(pg_path, 'Period', get_parameter(model, block_id, 'period', '1'));
    set_param(pg_path, 'PulseWidth', get_parameter(model, block_id, 'dutyCycle', '1'));
    set_param(pg_path, 'PhaseDelay', get_parameter(model, block_id, 'offset', '1'));

    % Constant block
    const_path = sprintf('%s/Const', block_path);
    add_block('simulink/Sources/Constant', const_path);
    set_param(const_path, 'Value', second);

    % Sum the Constant and Pulse Generator
    sum_path = sprintf('%s/Sum', block_path);
    add_block('simulink/Math Operations/Add', sum_path);
    set_param(sum_path, 'Inputs', '++');

    % Ouput line
    out_path = sprintf('%s/Out1', block_path);
    add_block('simulink/Ports & Subsystems/Out1', out_path);

    % Route Sum to output and Generators to Sum
    add_line(block_path, 'Sum/1', 'Out1/1');
    add_line(block_path, 'Const/1', 'Sum/1');
    add_line(block_path, 'Generator/1', 'Sum/2');

    set_common_parameters(model, block_id, model_path);
end
