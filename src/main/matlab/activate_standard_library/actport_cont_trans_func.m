% activate = 'system/Dynamical/ContTransFunc
function model = actport_cont_trans_func(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Continuous/Transfer Fcn', block_path);
    set_param(block_path, 'Denominator', get_parameter(model, block_id, 'den', '1'));
    set_param(block_path, 'Numerator', get_parameter(model, block_id, 'num', '-1'));

    set_common_parameters(model, block_id, model_path);
end