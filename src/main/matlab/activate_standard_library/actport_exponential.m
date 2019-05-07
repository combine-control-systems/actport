% activate = 'system/MathOperations/Exponential'
function model = actport_exponential(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    base = get_parameter(model, block_id, 'base', 'exp(1)');
    if strcmp(base, 'exp(1)')
        add_block('simulink/Math Operations/Math Func', block_path);
        set_param(block_path, 'Operator', 'exp');
    else
        % There isn't a block in Simulink able to select the base; use subblock and constant
        add_clean_subsystem(block_path);
        % Add exponential block
        exp_block_path = sprintf('%s/Power', block_path);
        add_block('simulink/Math Operations/Math Func', exp_block_path);
        set_param(exp_block_path, 'Operator', 'pow');
        % Add output port.
        add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block_path));
        % Connect exponential block and output port.
        add_line(block_path, 'Power/1', 'Out1/1');
        % Add constant block and connect to exponential block
        const_block_path = sprintf('%s/Base', block_path);
        add_block('simulink/Sources/Constant', const_block_path);
        set_param(const_block_path, 'Value', base);
        add_line(block_path, 'Base/1', 'Power/1');
        % Add input port and connect to power block
        add_block('simulink/Ports & Subsystems/In1', sprintf('%s/In1', block_path));
        add_line(block_path, 'In1/1', 'Power/2');
    end

    set_common_parameters(model, block_id, model_path);
end
