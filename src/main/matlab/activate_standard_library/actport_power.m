% activate = 'system/MathOperations/Power'
function model = actport_power(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    exponent = get_parameter(model, block_id, 'power', '3');
    % There isn't a block in Simulink able to select the power; use subblock and constant
    add_clean_subsystem(block_path);

    power_block_path = sprintf('%s/Power', block_path);
    add_block('simulink/Math Operations/Math Function', power_block_path);
    set_param(power_block_path, 'Operator', 'pow');
    % Add output port.
    add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block_path));
    % Connect power block and output port.
    add_line(block_path, 'Power/1', 'Out1/1');
    % Add input port and connect to power block
    add_block('simulink/Ports & Subsystems/In1', sprintf('%s/In1', block_path));
    add_line(block_path, 'In1/1', 'Power/1');
    % Add constant block and connect to power block
    exp_block_path = sprintf('%s/Exponent', block_path);
    add_block('simulink/Sources/Constant', exp_block_path);
    set_param(exp_block_path, 'Value', exponent);
    add_line(block_path, 'Exponent/1', 'Power/2');

    set_common_parameters(model, block_id, model_path);

    % Rearrange the blocks in the subsystem.
    Simulink.BlockDiagram.arrangeSystem(block_path);
end
