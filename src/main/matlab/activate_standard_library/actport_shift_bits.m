% activate = 'system/BitOperations/ShiftBits'
function model = actport_shift_bits(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    logger(sprintf('Some data types from %s might not be supported by Simulink', block_path));
    add_block('simulink/Logic and Bit Operations/Shift Arithmetic', block_path);

    if strcmp(get_parameter(model, block_id, 'np', '''Arithmetic'''), '''Circular''');
        logger(sprintf('For block %s circular shift is not supported by Simulink. Using Arithmetic shift', block_path));
    end
    set_param(block_path, 'BitShiftNumberSource', 'Dialog');
    set_param(block_path, 'BitShiftDirection', 'Bidirectional');
    % Simulink possitive numbers shift right and Activate possitive numbers shift left
    sn = get_parameter(model, block_id, 'nb', '0');
    sn = num2str(- str2num(sn));
    set_param(block_path, 'BitShiftNumber', sn);
    set_common_parameters(model, block_id, model_path);
end
