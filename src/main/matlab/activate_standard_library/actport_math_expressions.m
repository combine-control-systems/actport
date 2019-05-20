% activate = 'system/MathOperations/MathExpressions'
function model = actport_math_expressions(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    % Activate Expression has a lot more built-ins than Simulink Fnc. MATLAB Function is required
    add_block('simulink/User-Defined Functions/MATLAB Function', block_path);

    % Expressions
    nexx = str2double(get_parameter(model, block_id, 'nexx', '1'));
    exprs = string(get_parameter(model, block_id, 'Exp/exx', {'''(u1>0)*sin(u2)''', '''(u1<0)*cos(u2)'''}));
    for i = 1:nexx
        exprs(i) = strrep(exprs(i), '''', '');
        % Different function names
        exprs(i) = strrep(exprs(i), 'int', 'fix');
        % Activate gets a vector as an input in which elements are named u1...un
        exprs(i) = regexprep(exprs(i), 'u(\d+)', 'u\($1\)');
        % Activate sets input automatically, in Simulink it has to be done manually
        exprs(i) = sprintf('y(%i) = %s;\n', i, exprs(i));
    end
    sf = sfroot;
    block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
    block.Script = sprintf([...
        'function y = f(u)\n'...
        '%%#codegen\n'...
        'y = zeros(%i, 1);\n'...
        '%s\n'...
        'end\n'...
    ], nexx, join(exprs, ''));

    set_common_parameters(model, block_id, model_path);
end