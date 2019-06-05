% activate = 'system/Dynamical/DiscreteDerivative'
function model = actport_discrete_derivative(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discrete/Discrete Derivative', block_path);
    logger(sprintf('INFO: In Simulink block %s only supports fixed step solver', block_path));

    set_param(block_path, 'ICPrevScaledInput', get_parameter(model, block_id, 'init_cond', 'init_cond'));

    set_common_parameters(model, block_id, model_path);
end
