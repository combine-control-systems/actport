% activate = 'system/MatrixOperations/MatrixExponential'
function model = actport_matrix_exponential(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/User-Defined Functions/MATLAB Function', block_path);
    sf = sfroot();
    block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');


    block.Script = sprintf([...
      'function y = f(x)\n'...
      '%%#codegen\n'...
      'y = expm(x);\n'...
      'end\n'...
    ]);

    set_common_parameters(model, block_id, model_path);
end

