% activate = 'system/MathOperations/Sum'
function model = actport_sum(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Add', block_path);

    signs = get_parameter(model, block_id, 'in_ports/sgn', {'+', '+'});

    inputs = '';
    for i = 1:length(signs)
        inputs = strcat(inputs, strrep(string(signs(i)), '''', ''));
    end

    set_param(block_path, 'Inputs', inputs);

    set_common_parameters(model, block_id, model_path);
end
