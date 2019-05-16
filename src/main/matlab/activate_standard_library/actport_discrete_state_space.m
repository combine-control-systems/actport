% activate = 'system/Dynamical/DiscrStateSpace'
function model = actport_discrete_state_space(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discrete/Discrete State-Space', block_path);

    A = get_parameter(model, block_id, 'A', '1');
    set_param(block_path, 'A', A);

    B = get_parameter(model, block_id, 'B', '1');
    set_param(block_path, 'B', B);

    C = get_parameter(model, block_id, 'C', '1');
    set_param(block_path, 'C', C);

    D = get_parameter(model, block_id, 'D', '1');
    set_param(block_path, 'D', D);

    x0 = get_parameter(model, block_id, 'X0', '0');
    set_param(block_path, 'x0', x0);

    % We cannot trigger this block.
    model = set_event_input_port_invalid(model, block_id, 1);

    set_common_parameters(model, block_id, model_path);
end
