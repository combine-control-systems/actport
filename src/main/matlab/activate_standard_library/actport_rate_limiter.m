% activate = 'system/Hybrid/RateLimiter'
function model = actport_rate_limiter(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discontinuities/Rate Limiter', block_path);
    set_param(block_path, 'RisingSlewLimit', get_parameter(model, block_id, 'upper', '1'));
    set_param(block_path, 'FallingSlewLimit', get_parameter(model, block_id, 'lower', '-1'));
    set_param(block_path, 'InitialCondition', get_parameter(model, block_id, 'init', '0.0'));

    set_common_parameters(model, block_id, model_path);
end
