% activate = 'system/SignalGenerators/Ramp'
function model = actport_step_generator(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sources/Ramp', block_path);
    set_param(block_path, 'slope', get_parameter(model, block_id, 'slope', '1'));
    set_param(block_path, 'start', get_parameter(model, block_id, 'startt', '0'));
    set_param(block_path, 'InitialOutput', get_parameter(model, block_id, 'initout', '0'));
    if strcmp(get_parameter(model, block_id, 'zc', '0'), '0')
        error("Zero-crossing on ramp block not supported by Simulink");
    end

    set_common_parameters(model, block_id, model_path);
end
