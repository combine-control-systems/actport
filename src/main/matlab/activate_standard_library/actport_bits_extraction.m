% activate = 'system/BitOperations/BitsExtraction'
function model = actport_bits_extraction(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    logger(sprintf('Some data types from %s might not be supported by Simulink', block_path));
    add_block('simulink/Logic and Bit Operations/Extract Bits', block_path);

    alg = strrep(get_parameter(model, block_id, 'rule', '''UpperHalf'''), '''', '');
    switch alg
        case 'UpperHalf'
            set_param(block_path, 'bitsToExtract', 'Upper half');
        case 'LowerHalf'
            set_param(block_path, 'bitsToExtract', 'Lower half');
        case 'RangeFromMSB'
            set_param(block_path, 'bitsToExtract', 'Range starting with most significant bit');
            set_param(block_path, 'numBits', get_parameter(model, block_id, 'bit', '0'));
        case 'RangeToLSB'
            set_param(block_path, 'bitsToExtract', 'Range ending with least significant bit');
            set_param(block_path, 'numBits', get_parameter(model, block_id, 'bit', '0'));
        case 'RangeOfBits'
            set_param(block_path, 'bitsToExtract', 'Range of bits');
            set_param(block_path, 'bitIdxRange', get_parameter(model, block_id, 'bit', '0'));
    end
    if strcmp(get_parameter(model, block_id, 'scal', '0'), '0')
        set_param(block_path, 'outScalingMode', 'Preserve fixed-point scaling');
    else
        set_param(block_path, 'outScalingMode', 'Treat bit field as an integer');
    end

    set_common_parameters(model, block_id, model_path);
end
