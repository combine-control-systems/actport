% activate = 'system/Hybrid/Quantization'
function model = actport_quatinzation(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Discontinuities/Quantizer', block_path);
    set_param(block_path, 'QuantizationInterval', get_parameter(model, block_id, 'step', '0.1'));

    %TODO: Several rounding methods in activate not available in Simulink. Maybe manual implementation

    set_common_parameters(model, block_id, model_path);
end
