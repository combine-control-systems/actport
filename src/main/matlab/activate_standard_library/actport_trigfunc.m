% activate = 'system/MathOperations/TrigFunc'
function model = actport_trigfunc(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Trigonometric Function', block_path);

    % All functions available in Activate have the same name in Simulink
    func = get_parameter(model, block_id, 'func', '''sin''');
    set_param(block_path, 'Operator', strrep(func, '''', ''));

    set_common_parameters(model, block_id, model_path);
end
