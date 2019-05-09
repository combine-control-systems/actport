% activate = 'system/MathOperations/Constraint'
function model = actport_constraint(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Algebraic Constraint', block_path);
    set_param(block_path, 'InitialGuess', get_parameter(model, block_id, 'x0', '0'));

    %TODO: Initial output derivatives is not supported by Simulink
    set_common_parameters(model, block_id, model_path);
end