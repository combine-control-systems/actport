% activate = 'system/SignalGenerators/VariableFreqSine'
function model = actport_variable_freq_sine(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    % Simulink does not suport variable freq sine, so a clock will be used for that
    add_clean_subsystem(block_path);

    % Clock
    add_block('simulink/Sources/Clock', sprintf('%s/Clock', block_path));

    % Function
    f = str2double(get_parameter(model, block_id, 'FInit', '0.1'));
    r = str2double(get_parameter(model, block_id, 'IncreaseRate', '0.1'));
    func_path = sprintf('%s/Func', block_path);
    add_block('simulink/User-Defined Functions/MATLAB Function', func_path);
    sf = sfroot();
    block = sf.find('Path', func_path, '-isa', 'Stateflow.EMChart');
    block.Script = sprintf([...
        'function y = f(x)\n'...
        '%%#codegen\n'...
        'y = sin(2 * pi * (%d + %d * x / 2) * x);\n'...
        'end\n'...
    ], f, r);

    % Route and output
    add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block_path));
    add_line(block_path, 'Clock/1', 'Func/1');
    add_line(block_path, 'Func/1', 'Out1/1');

    % Rearrange the blocks in the subsystem.
    Simulink.BlockDiagram.arrangeSystem(block_path);

    set_common_parameters(model, block_id, model_path);
end
