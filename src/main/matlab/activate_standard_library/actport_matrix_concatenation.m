% activate = 'system/MatrixOperations/MatrixConcatenation'
function model = actport_matrix_concatenation(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Matrix Concatenate', block_path);
    set_param(block_path, 'NumInputs', get_parameter(model, block_id, 'nin', '2'));
    set_param(block_path, 'Mode', 'Multidimensional array');

    if strcmp(get_parameter(model, block_id, 'method', '''Horizontal'''), '''Horizontal''')
        set_param(block_path, 'ConcatenateDimension', '2');
    else
        set_param(block_path, 'ConcatenateDimension', '1');
    end

    set_common_parameters(model, block_id, model_path);
end
