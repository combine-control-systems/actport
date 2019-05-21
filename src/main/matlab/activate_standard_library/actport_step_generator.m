% activate = 'system/SignalGenerators/StepGenerator'
function model = actport_step_generator(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sources/Step', block_path);
    set_param(block_path, 'Time', get_parameter(model, block_id, 'steptime', '1'));
    set_param(block_path, 'Before', bool_translation(get_parameter(model, block_id, 'iniv', '0')));
    set_param(block_path, 'After', bool_translation(get_parameter(model, block_id, 'finv', '1')));
    set_common_parameters(model, block_id, model_path);
end
