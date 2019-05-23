% activate = 'system/Dynamical/ContStateSpace
function model = actport_cont_state_space(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Continuous/State-Space', block_path);
    set_param(block_path, 'A', get_parameter(model, block_id, 'A', '-1'),...
                          'B', get_parameter(model, block_id, 'B', '1'),...
                          'C', get_parameter(model, block_id, 'C', '1'),...
                          'D', get_parameter(model, block_id, 'D', '0'),...
                          'X0', get_parameter(model, block_id, 'x0', '0'));

    set_common_parameters(model, block_id, model_path);
end