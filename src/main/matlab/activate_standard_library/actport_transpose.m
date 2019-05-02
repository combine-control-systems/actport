% activate = 'system/MatrixOperations/Transpose'
function model = actport_transpose(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Math Function', block_path);

    rule = get_parameter(model, block_id, 'rule', '''transpose''');
    switch rule
        case '''Transpose'''
            set_param(block_path, 'Operator', 'transpose');
        case '''Hermitian(Transpose-Conjugate)'''
            set_param(block_path, 'Operator', 'hermitian');
        otherwise
            error(sprintf('unsupported transpose rule %s', rule));
    end

    set_common_parameters(model, block_id, model_path);
end
