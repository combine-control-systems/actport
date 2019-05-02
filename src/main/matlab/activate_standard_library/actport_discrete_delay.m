% activate = 'system/Dynamical/DiscreteDelay'
function model = actport_discrete_delay(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discrete/Unit Delay', block_path);

    initial_condition = get_parameter(model, block_id, 'init_cond', '0');
    set_param(block_path, 'InitialCondition', initial_condition);

    set_common_parameters(model, block_id, model_path);
end
