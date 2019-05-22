% activate = 'system/SignalGenerators/SignalGenerator'
function model = actport_signal_generator(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sources/Repeating Sequence Interpolated', block_path);

    set_param(block_path, 'OutValues', get_parameter(model, block_id, 'yy', '[4,7,6,5]'));
    set_param(block_path, 'TimeValues', get_parameter(model, block_id, 'xx', '[0,1,2,4]'));
    type = strrep(get_parameter(model, block_id, 'typ', '''double'''), '''', '');
    switch type
        case 'inherit'
            type =  'Inherit: Inherit via back propagation';
        case 'boolean'
            logger('Simulink does not have boolean as output type of Repeating Sequence', block_path);
    end
    set_param(block_path, 'OutDataTypeStr', type);

    method = strrep(get_parameter(model, block_id, 'Method', '''Linear'''), '''', '');
    switch method
        case 'Linear'
            method = 'Interpolation-Use End Values';
        otherwise
            logger('Simulink only supports linear interpolation', block_path);
    end
    set_param(block_path, 'LookUpMeth', method)

    left = strrep(get_parameter(model, block_id, 'Leftside', '''Zero'''), '''', '');
    if not(strcmp(left, 'Hold'))
        logger('Simulink only supports Hold before time span', block_path);
    end

    right = strrep(get_parameter(model, block_id, 'Rightside', '''Hold'''), '''', '');
    if not(strcmp(left, 'Repeat'))
        logger('Simulink only supports Repeat after time span', block_path);
    end

    % Not supported properties
    if not(strcmp(get_parameter(model, block_id, 'outevent', '0'), '0'))
        logger('Simulink does not support extracting time events', block_path);
    end
    if not(strcmp(get_parameter(model, block_id, 'firstder', '0'), '0'))
        logger('Simulink does not support setting first derivative', block_path);
    end
    if not(strcmp(get_parameter(model, block_id, 'secondder', '0'), '0'))
        logger('Simulink does not support setting second derivative', block_path);
    end
    if not(strcmp(get_parameter(model, block_id, 'externalActivation', '0'), '0'))
        logger('Simulink does not support external activation', block_path);
    end
    
    set_common_parameters(model, block_id, model_path);
end
