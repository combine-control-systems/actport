% activate = 'system/MatrixOperations/CrossProduct'
function model = actport_cross_product(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/User-Defined Functions/MATLAB Function', block_path);
    sf = sfroot();
    block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
    block.Script = sprintf([ ...
        'function y = f(x1, x2)\n' ...
        '%%#codegen\n' ...
        'y = cross(x1, x2);\n' ...
        'end\n' ...
    ]);

    set_common_parameters(model, block_id, model_path);
end
