% activate = 'system/MathOperations/Horner'
function model = actport_horner(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Polynomial', block_path);
    if strcmp('0', get_parameter(model, block_id, 'mode', '0'))
        logger('Polynomial cofficients from port not implemented.', block_path);
    end
    set_param(block_path, 'coefs', get_parameter(model, block_id, 'coeffs', '[0]'));

    set_common_parameters(model, block_id, model_path);
end