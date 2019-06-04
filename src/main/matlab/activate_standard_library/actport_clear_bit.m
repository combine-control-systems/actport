% activate = 'system/BitOperations/ClearBit'
function model = actport_clear_bit(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    logger(sprintf('Some data types from %s might not be supported by Simulink', block_path));
    add_block('simulink/Logic and Bit Operations/Bit Clear', block_path);
    set_param(block_path, 'iBit', get_parameter(model, block_id, 'bit', '0'));

    set_common_parameters(model, block_id, model_path);
end
