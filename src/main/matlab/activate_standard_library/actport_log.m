% activate = 'system/MathOperations/Log'
function model = actport_log(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    base = get_parameter(model, block_id, 'base', 'exp (1)');
    if strcmp(base, 'exp (1)')
        add_block('simulink/Math Operations/Math Function', block_path);
        set_param(block_path, 'Operator', 'log');
    else
        % There isn't a block in Simulink able to select the base; use subblock and constant
        add_clean_subsystem(block_path);

        % There is no log(base)(value) available, so we calculate using log(u)/log(v)
        log_block_path = sprintf('%s/Log', block_path);
        add_block('simulink/User-Defined Functions/MATLAB Function', log_block_path);
        sf = sfroot();
        block = sf.find('Path', log_block_path, '-isa', 'Stateflow.EMChart');
        block.Script = sprintf([...
            'function x = f(u, v)\n'...
            '%#codegen\n'...
            'x = log(u)/log(v);'...
            'end\n'...
        ]);
        % Add output port.
        add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block_path));
        % Connect log block and output port.
        add_line(block_path, 'Log/1', 'Out1/1');
        % Add input port and connect to log block
        add_block('simulink/Ports & Subsystems/In1', sprintf('%s/In1', block_path));
        add_line(block_path, 'In1/1', 'Log/1');
        % Add constant block and connect to log block
        base_block_path = sprintf('%s/Base', block_path);
        add_block('simulink/Sources/Constant', base_block_path);
        set_param(base_block_path, 'Value', base);
        add_line(block_path, 'Base/1', 'Log/2');

        % Rearrange the blocks in the subsystem.
        Simulink.BlockDiagram.arrangeSystem(block_path);
    end

    set_common_parameters(model, block_id, model_path);

end
