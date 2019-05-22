% activate = 'system/Routing/ConditionalSelect'
function model = actport_conditional_select(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_clean_subsystem(block_path);
    switch_path = sprintf('%s/Switch', block_path);

    add_block('simulink/Signal Routing/Switch', switch_path);
    logger("Control input datatype is automatically decided by Simulink", block_path);
    thres = get_parameter(model, block_id, 'thra', '0');
    if min(size(str2num(thres))) > 1
        logger("Simulink only supports scalars and vectors for inputs and threshold of Switch block", block_path);
    end
    set_param(switch_path, 'Threshold', thres);

    rule = strrep(get_parameter(model, block_id, 'rule', '''u2>=a'''), '''', '');
    % Configuration of the control port.
    ctrl_path = sprintf('%s/In2', block_path);
    add_block('simulink/Ports & Subsystems/In1', ctrl_path);
    set_param(ctrl_path, 'Port', '2');
    switch rule
        case {'u2>=a', 'u2<=a'}
            set_param(switch_path, 'Criteria', 'u2 >= Threshold');
            % Routing
            add_line(block_path, 'In2/1', 'Switch/2');
        case {'u2>a', 'u2<a'}
            set_param(switch_path, 'Criteria', 'u2 > Threshold');
            % Routing
            add_line(block_path, 'In2/1', 'Switch/2');
        case {'u2==a', 'u2~=a'}
            set_param(switch_path, 'Criteria', 'u2 ~= 0');
            % Simulink only supports comparison with zero. The difference has to be subtracted
            % Const block
            const_path = sprintf('%s/Const', block_path);
            add_block('simulink/Sources/Constant', const_path);
            set_param(const_path, 'Value', thres);
            % Subtraction
            sub_path = sprintf('%s/Subtract', block_path);
            add_block('simulink/Math Operations/Subtract', sub_path);
            % Routing
            add_line(block_path, 'In2/1', 'Subtract/1');
            add_line(block_path, 'Const/1', 'Subtract/2');
            add_line(block_path, 'Subtract/1', 'Switch/2');
        case 'u2==true'
            set_param(switch_path, 'Criteria', 'u2 ~= 0');
            % Routing
            add_line(block_path, 'In2/1', 'Switch/2');
    end

    % Configuration of the input ports
    in1_path = sprintf('%s/In1', block_path);
    add_block('simulink/Ports & Subsystems/In1', in1_path);
    set_param(in1_path, 'Port', '1');
    in3_path = sprintf('%s/In3', block_path);
    add_block('simulink/Ports & Subsystems/In1', in3_path);
    set_param(in3_path, 'Port', '3');
    switch rule
        case {'u2>=a', 'u2>a', 'u2~=a', 'u2==true'}
            add_line(block_path, 'In1/1', 'Switch/1');
            add_line(block_path, 'In3/1', 'Switch/3');
        case {'u2<=a', 'u2<a', 'u2==a'}
            add_line(block_path, 'In1/1', 'Switch/3');
            add_line(block_path, 'In3/1', 'Switch/1');
    end

    % Output port
    add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block_path));
    add_line(block_path, 'Switch/1', 'Out1/1');

    set_common_parameters(model, block_id, model_path);

    % Rearrange the blocks in the subsystem.
    Simulink.BlockDiagram.arrangeSystem(block_path);
end
