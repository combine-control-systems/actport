% activate = 'system/MathOperations/MathExpression'
function model = actport_math_expression(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    % Activate Expression has a lot more built-ins than Simulink Fnc. MATLAB Function is required
    add_block('simulink/User-Defined Functions/MATLAB Function', block_path);

    % Inputs
    nin = str2double(get_parameter(model, block_id, 'nin', '1'));
    inputs = 'u1';
    for i = 2:nin
        inputs = strcat(inputs, ', ', sprintf('u%i', i));
    end

    % Expression
    expr = get_parameter(model, block_id, 'exx', '''(u1>0)*sin(u2)''');
    expr = strrep(expr, '''', '');
    expr = strrep(expr, 'int', 'fix');
    sf = sfroot;
    block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
    block.Script = sprintf([...
        'function y = f(%s)\n'...
        '%%#codegen\n'...
        'y = %s;\n'...
        'end\n'...
    ], inputs, expr);

    set_common_parameters(model, block_id, model_path);
end