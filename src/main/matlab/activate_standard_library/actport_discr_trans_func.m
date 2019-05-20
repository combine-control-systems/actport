% activate = 'system/Dynamical/DiscrTransFunc'
function model = actport_discr_trans_func(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discrete/Discrete Transfer Fcn', block_path);
    set_param(block_path, 'NumeratorSource', 'Dialog');
    set_param(block_path, 'DenominatorSource', 'Dialog');
    set_param(block_path, 'Numerator', get_parameter(model, block_id, 'num', '[1,0]'));
    set_param(block_path, 'Denominator', get_parameter(model, block_id, 'den', '[1,1]'));

    if strcmp(get_parameter(model, block_id, 'externalActivation', '0'), '1')
        warning("External activation not implemented yet");
    end

    set_common_parameters(model, block_id, model_path);
end
