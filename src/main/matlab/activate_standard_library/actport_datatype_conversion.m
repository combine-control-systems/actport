% activate = 'system/SignalConversions/DatatypeConversion'
function model = actport_datatype_conversion(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Signal Attributes/Data Type Conversion', block_path);
    logger(sprintf('In block %s Simulink automatically detects input datatype', block_path));
    out = strrep(get_parameter(model, block_id, 'ot', '''inherit'''), '''', '');
    of = strrep(get_parameter(model, block_id, 'satur', '''Nothing'''), '''', '');
    round = strrep(get_parameter(model, block_id, 'rmethod', '''Floor'''), '''', '');

    if strcmp(out, 'inherit')
        out = 'Inherit: Inherit via back propagation';
    end
    set_param(block_path, 'OutDataTypeStr', out);

    switch of
        case 'Saturate'
            set_param(block_path, 'SaturateOnIntegerOverflow', 'on');
        case 'Nothing'
            set_param(block_path, 'SaturateOnIntegerOverflow', 'off');
        % TODO: Handle "Error" case properly.
        case 'Error'
            logger(sprintf('Currently overflow on %s in not managed in Simulink', block_path));
            set_param(block_path, 'SaturateOnIntegerOverflow', 'off');
        otherwise
            set_param(block_path, 'SaturateOnIntegerOverflow', 'off');
    end

    switch round
        case 'Floor'
            set_param(block_path, 'RndMeth', 'Floor');
        case 'Ceil'
            set_param(block_path, 'RndMeth', 'Ceiling');
        case 'Round'
            set_param(block_path, 'RndMeth', 'Round');
        case 'Int'
            set_param(block_path, 'RndMeth', 'Zero');
    end

    set_common_parameters(model, block_id, model_path);
end
