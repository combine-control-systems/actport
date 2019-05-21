% activate = 'system/MatrixOperations/DiagonalMatrix'
function model = actport_diagonal_matrix(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/User-Defined Functions/MATLAB Function', block_path);
    offset = char(get_parameter(model, block_id, 'offset', '0'));
    sf = sfroot;
    block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
    block.Script = sprintf([...
        'function y = f(x)\n'...
        '%%#codegen\n'...
        'y = diag(x, %s);\n'...
        'end\n'...
    ], offset);

    set_common_parameters(model, block_id, model_path);
end
