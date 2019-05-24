% activate = 'system/MatrixOperations/CumulativeSum
function model = actport_cumulative_sum(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/User-Defined Functions/MATLAB Function', block_path);

    sf = sfroot();
    block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
    if strcmp(get_parameter(model, block_id, 'decomptyp', '''Rows'''), '''Rows''')
        block.Script = sprintf([
            'function y = f(x)\n'...
            '%%#codegen\n'...
            'sz = size(x);\n'...
            'y = zeros(sz);\n'...
            'y(:,1) = x(:,1);\n'...
            'for j=2:sz(2)\n'...
            '  for i=1:sz(1)\n'...
            '    y(i,j) = x(i,j) + y(i,j-1);\n'...
            '  end\n'...
            'end\n'...
            'end\n'...
        ]);
    else
        block.Script = sprintf([
            'function y = f(x)\n'...
            '%%#codegen\n'...
            'sz = size(x);\n'...
            'y = zeros(sz);\n'...
            'y(1,:) = x(1,:);\n'...
            'for i=2:sz(1)\n'...
            '  for j=1:sz(2)\n'...
            '    y(i,j) = x(i,j) + y(i-1,j);\n'...
            '  end\n'...
            'end\n'...
            'end\n'...
        ]);
    end

    set_common_parameters(model, block_id, model_path);
end
