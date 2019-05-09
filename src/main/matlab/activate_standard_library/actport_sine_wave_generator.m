% activate = 'system/SignalGenerators/SineWaveGenerator'
function model = actport_sine_wave_generator(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    % TODO: Check results for external activation set on
    add_block('simulink/Sources/Sine Wave', block_path);
    set_param(block_path, 'Amplitude', get_parameter(model, block_id, 'M', '1'));
    set_param(block_path, 'Frequency', get_parameter(model, block_id, 'F', '1'));
    set_param(block_path, 'Phase', get_parameter(model, block_id, 'P', '0'));
    set_param(block_path, 'Bias', get_parameter(model, block_id, 'offs', '0'));
    set_common_parameters(model, block_id, model_path);
end