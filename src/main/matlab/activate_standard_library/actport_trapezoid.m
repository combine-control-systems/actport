% activate = 'system/SignalGenerators/Trapezoid'
function model = actport_trapezoid(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    amplitude = str2double(get_parameter(model, block_id, 'amplitude', '2'));
    rising = str2double(get_parameter(model, block_id, 'rising', '1'));
    width = str2double(get_parameter(model, block_id, 'width', '1'));
    falling = str2double(get_parameter(model, block_id, 'falling', '1'));
    period = str2double(get_parameter(model, block_id, 'period', '1'));
    offset = str2double(get_parameter(model, block_id, 'offset', '1'));
    t = [0 rising (rising+width) (rising+width+falling) period]
    y = [offset (offset+amplitude) (offset+amplitude) offset offset]

    if not(strcmp(get_parameter(model, block_id, 'nperiod', '-1'), '-1'))
        logger('Only -1 is supported in Simulink as number of periods (repeating sequence)', block_path);
    end

    % Simulink does not support delay
    add_clean_subsystem(block_path);

    seq_block_path = sprintf('%s/Sequence', block_path);
    add_block('simulink/Sources/Repeating Sequence', seq_block_path);
    set_param(seq_block_path, 'rep_seq_t', mat2str(t), 'rep_seq_y', mat2str(y));

    % Delay block
    delay_block_path = sprintf('%s/Delay', block_path);
    add_block('simulink/Continuous/Transport Delay', delay_block_path);
    set_param(delay_block_path, 'DelayTime', get_parameter(model, block_id, 'startTime', '12'));
    set_param(delay_block_path, 'InitialOutput', num2str(offset));

    % Output line
    out_path = sprintf('%s/Out1', block_path);
    add_block('simulink/Ports & Subsystems/Out1', out_path);

    % Route the submodel
    add_line(block_path, 'Sequence/1', 'Delay/1');
    add_line(block_path, 'Delay/1', 'Out1/1');

    % Rearrange the blocks in the subsystem.
    Simulink.BlockDiagram.arrangeSystem(block_path);

    set_common_parameters(model, block_id, model_path);
end
