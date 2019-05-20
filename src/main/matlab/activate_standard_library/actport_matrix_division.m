% activate = 'system/MatrixOperations/MatrixDivision'
function model = actport_matrix_division(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    slash = strcmp(get_parameter(model, block_id, 'div_typ/slash', 1'), '1');

    add_block('simulink/Math Operations/Divide', block_path);
        set_param(block_path, 'Multiplication', 'Matrix(*)');

    if slash
        set_param(block_path, 'Inputs', '*/');
    else
        set_param(block_path, 'Inputs', '/*');
    end

    set_common_parameters(model, block_id, model_path);
end
