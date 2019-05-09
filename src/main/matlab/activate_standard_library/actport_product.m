% activate = 'system/MathOperations/Product'
function model = actport_product(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Product', block_path);
    set_param(block_path, 'Multiplication', 'Element-wise(.*)');

    ops = get_parameter(model, block_id, 'in_ports/sgn', {'*', '*'});

    inputs = '';
    for i = 1:length(ops)
        inputs = strcat(inputs, strrep(string(ops(i)), '''', ''));
    end
    set_param(block_path, 'Inputs', inputs);

    round = get_parameter(model, block_id, 'rmethod', '''Floor''');
    switch round
        case '''Ceil'''
            round = 'Ceiling';
        case '''Int'''
            round = 'Zero';
        otherwise
            round = round(2:end-1);
    end
    set_param(block_path, 'RndMeth', round);
    %TODO: Handle overflow properly

    set_common_parameters(model, block_id, model_path);
end