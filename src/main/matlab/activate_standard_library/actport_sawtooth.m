% activate = 'system/SignalGenerators/Sawtooth'
function model = actport_sawtooth(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    freq = str2double(get_parameter(model, block_id, 'period', '3'));
    startv = str2num(get_parameter(model, block_id, 'down', '1'));
    endv = str2num(get_parameter(model, block_id, 'up', '0'));
    amplitude = (startv - endv) / 2;
    origin = (endv + amplitude);
    if not(strcmp(get_parameter(model, block_id, 'tinit', '0'), '0'))
        warning('Time offset on sawtooth generator is not supported');
    end

    % Simulink only defines Amplitude and Frequency
    add_clean_subsystem(block_path);

    st_block_path = sprintf('%s/Sawtooth', block_path);
    add_block('simulink/Sources/Signal Generator', st_block_path);
    set_param(st_block_path, 'WaveForm', 'sawtooth');
    set_param(st_block_path, 'Units', 'Hertz');
    set_param(st_block_path, 'Frequency', mat2str(1 / freq));
    set_param(st_block_path, 'Amplitude', mat2str(amplitude));

    % Constant block
    const_block_path = sprintf('%s/Const', block_path);
    add_block('simulink/Sources/Constant', const_block_path);
    set_param(const_block_path, 'Value', mat2str(origin));

    % Sum the Constant and Pulse Generator
    sum_path = sprintf('%s/Sum', block_path);
    add_block('simulink/Math Operations/Sum', sum_path);

    % Ouput line
    out_path = sprintf('%s/Out1', block_path);
    add_block('simulink/Ports & Subsystems/Out1', out_path);

    % Route Sum to output and Generators to Sum
    add_line(block_path, 'Sum/1', 'Out1/1');
    add_line(block_path, 'Const/1', 'Sum/1');
    add_line(block_path, 'Sawtooth/1', 'Sum/2');

    % Rearrange the blocks in the subsystem.
    Simulink.BlockDiagram.arrangeSystem(block_path);

    set_common_parameters(model, block_id, model_path);
end
