% activate = 'system/MatrixOperations/MatrixInverse'
function model = actport_matrix_inverse(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Divide', block_path);
    set_param(block_path, 'Inputs', '/');
    set_param(block_path, 'Multiplication', 'Matrix(*)');

    set_common_parameters(model, block_id, model_path);
end
