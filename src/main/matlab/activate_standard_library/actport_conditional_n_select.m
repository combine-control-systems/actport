% activate = 'system/Routing/ConditionalNSelect'
function model = actport_conditional_n_select(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    % Simulink only supports rounding to zero. Other rounding functions have to be manually implemented
    round = strrep(get_parameter(model, block_id, 'rule', '''int'''), '''', '');
    if strcmp(round, 'int')
        add_block('simulink/Signal Routing/Multiport Switch', block_path);
        if strcmp(get_parameter(model, block_id, 'base', '1'), '0')
            set_param(block_path, 'DataPortOrder', 'Zero-based contiguous');
        else
            set_param(block_path, 'DataPortOrder', 'One-based contiguous');
        end
        set_param(block_path, 'Inputs', get_parameter(model, block_id, 'nin', '3'));
        set_param(block_path, 'DiagnosticForDefault', 'Warning');
    else
        add_clean_subsystem(block_path)

        cond_path = sprintf('%s/Cond', block_path);
        add_block('simulink/Signal Routing/Multiport Switch', cond_path);
        if strcmp(get_parameter(model, block_id, 'base', '1'), '0')
            set_param(cond_path, 'DataPortOrder', 'Zero-based contiguous');
        else
            set_param(cond_path, 'DataPortOrder', 'One-based contiguous');
        end
        nin = get_parameter(model, block_id, 'nin', '3');
        set_param(cond_path, 'Inputs', nin);
        set_param(cond_path, 'DiagnosticForDefault', 'Warning');

        % Rounding block
        round_path = sprintf('%s/Round', block_path);
        add_block('simulink/Math Operations/Rounding Function', round_path);
        set_param(round_path, 'Operator', round);

        add_block('simulink/Ports & Subsystems/In1', sprintf('%s/In1', block_path));
        add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block_path));
        add_line(block_path, 'In1/1', 'Round/1');
        add_line(block_path, 'Round/1', 'Cond/1');
        add_line(block_path, 'Cond/1', 'Out1/1');
        for i = 2:(str2num(nin)+1)
            add_block('simulink/Ports & Subsystems/In1', sprintf('%s/In%i', block_path, i));
            add_line(block_path, sprintf('In%i/1', i), sprintf('Cond/%i', i));
        end

        % Rearrange the blocks in the subsystem.
        Simulink.BlockDiagram.arrangeSystem(block_path);
    end

    set_common_parameters(model, block_id, model_path);

end
