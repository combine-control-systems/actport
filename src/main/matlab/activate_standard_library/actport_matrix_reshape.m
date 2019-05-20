% activate = 'system/MatrixOperations/MatrixReshape'
function model = actport_matrix_reshape(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    outsize = char(get_parameter(model, block_id, 'outsize', '[1,1]'));

    add_block('simulink/Math Operations/Reshape', block_path);
    set_param(block_path, 'OutputDimensionality', 'Customize');
    set_param(block_path, 'OutputDimensions', outsize);

    set_common_parameters(model, block_id, model_path);
end
