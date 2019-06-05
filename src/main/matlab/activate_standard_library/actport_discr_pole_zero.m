% activate = 'system/Dynamical/DiscrPoleZero'
function model = actport_discr_pole_zero(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discrete/Discrete Zero-Pole', block_path);

    set_param(block_path, 'Zeros', get_parameter(model, block_id, 'zer', '[-0.5]'));
    set_param(block_path, 'Poles', get_parameter(model, block_id, 'pol', '[0.5]'));
    set_param(block_path, 'Gain', get_parameter(model, block_id, 'k_gain', '1'));

    set_common_parameters(model, block_id, model_path);
end
