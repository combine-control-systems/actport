% activate = 'system/MatrixOperations/MatrixExpression'
function model = actport_matrix_expression(model, block_id, model_path)
    % No difference.
    model = actport_math_expression(model, block_id, model_path);
end
