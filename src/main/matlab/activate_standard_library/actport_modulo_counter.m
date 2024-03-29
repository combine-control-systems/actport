% activate = 'system/SignalGenerators/ModuloCounter'
function model = actport_modulo_counter(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    base = get_parameter(model, block_id, 'base', '3');
    step = get_parameter(model, block_id, 'step', '1');
    iout = get_parameter(model, block_id, 'ini_state', '0');
    if strcmp(iout, '-1')
        iout = num2str(str2double(base) - 1);
    end
    type = get_parameter(model, block_id, 'typ', '''double''');

    % Simulink counter is too simple to reproduce Activate's counter. Using function block.
    add_block('simulink/User-Defined Functions/MATLAB Function', block_path);
    sf = sfroot();
    block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
    block.Script = sprintf([...
        'function y = f()\n'...
        '%%#codegen\n'...
        '   persistent count;\n'...
        '   if isempty(count)\n'...
        '       count = mod(%1$s, %2$s); %% Initial output, base\n'...
        '   else\n'...
        '       count = count + %3$s; %% Step\n'...
        '       count = mod(count, %2$s); %% Base\n'...
        '   end\n'...
        '   aux = count;\n'...
        '   y = cast(aux, %4$s);\n'...
        'end\n'...
    ], iout, base, step, type);

    set_common_parameters(model, block_id, model_path);
end
