% activate = 'system/AdvancedDynamical/ContTransFunc_Y'
function model = actport_cont_trans_func_y(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink_extras/Additional Linear/Transfer Fcn (with initial outputs)', block_path);
    set_param(block_path, 'D', get_parameter(model, block_id, 'den', '1'));
    set_param(block_path, 'N', get_parameter(model, block_id, 'num', '-1'));
    set_param(block_path, 'Y0', get_parameter(model, block_id, 'y0', '0'));

    set_common_parameters(model, block_id, model_path);
end
