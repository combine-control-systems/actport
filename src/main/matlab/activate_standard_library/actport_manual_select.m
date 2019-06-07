% activate = 'system/Routing/ManualSelect'
function model = actport_manual_select(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    n = eval(get_parameter(model, block_id, 'nin', '2'));
    if n == 2
        add_block('simulink/Signal Routing/Manual Switch', block_path);
    else
        logger(sprintf('Block %s: Simulink only supports manual switch with 2 ports. A tree is implemented for more ports', block_path));
        add_clean_subsystem(block_path);

        % Create and list inputs
        tree = cell(n, 1);
        for i=1:n
            in = sprintf('In%i', i);
            add_block('simulink/Ports & Subsystems/In1', sprintf('%s/%s', block_path, in));
            tree{i} = in;
        end

        % Generate the tree
        i = 1;
        while length(tree) > 1
            input1 = tree{1};
            input2 = tree{2};
            tree(1:2) = [];
            switch_n = sprintf('Switch%i', i);
            add_block('simulink/Signal Routing/Manual Switch', sprintf('%s/%s', block_path, switch_n));
            add_line(block_path, strcat(input1, '/1'), strcat(switch_n, '/1'));
            add_line(block_path, strcat(input2, '/1'), strcat(switch_n, '/2'));
            tree{end + 1} = switch_n;
            i = i + 1;
        end

        % Output
        add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block_path));
        add_line(block_path, strcat(tree{1}, '/1'), 'Out1/1');

        % Rearrange the blocks in the subsystem.
        Simulink.BlockDiagram.arrangeSystem(block_path);
    end

    set_common_parameters(model, block_id, model_path);
end
