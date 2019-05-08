function model = evaluate_model(system)
    % Perform evaluation of model.
    import actport.model.Matlab.*

    model = create_model(system);

    % Apply model transformations.
    fprintf('* Applying model transformations.\n');
    model = apply_transformations(model);

    model_name = string(get_name(model, 0));

    fprintf('* Creating new Simulink system: %s.\n', model_name);
    new_system(model_name);
    open_system(model_name);

    % Set root context.
    context = char(get_context(model, 0));
    if ~isempty(context)
        set_param(model_name, 'InitFcn', context);
    end

    % Add blocks.
    fprintf('* Adding blocks to system.\n');
    model = add_blocks(model, 0, model_name);

    % Post add blocks transformations.
    fprintf('* Applying post block model transformations.\n');
    model = apply_post_blocks_transformations(model);

    % Add links.
    fprintf('* Adding links.\n');
    model = add_links(model);

    % Arrange model.
    fprintf('* Automatically rearranging model.\n');
    rearrange_model(model);
end

function model = apply_transformations(model)
    import actport.model.transform.Matlab.*
    fprintf('\t* Remove split blocks.\n');
    model = remove_split_blocks(model);
    fprintf('\t* Eliminating SampleClock blocks.\n');
    model = eliminate_sample_clock_blocks(model);
    fprintf('\t* Map event ports.\n');
    model = map_event_ports(model);
end

function model = apply_post_blocks_transformations(model)
    import actport.model.transform.Matlab.*
    fprintf('\t* Remove illegal links.\n');
    model = remove_illegal_links(model);
end

function model = add_blocks(model, parentId, model_path)
    import actport.model.Matlab.*

    % Add blocks.
    children = get_children(model, parentId);
    for i = 1:length(children)
        id = children(i);
        activateId = string(get_activate_id(model, id));
        f = find_generator(activateId);
        model = f(model, id, model_path);
        model = add_blocks(model, id, sprintf('%s/%s', model_path, get_name(model, id)));
    end
end

function model = add_links(model)
    import actport.model.Matlab.*

    blocks = get_all_blocks(model);

    for k = 1:length(blocks)
        % Add links.
        links = get_links(model, blocks(k));
        system_path = char(get_path(model, blocks(k)));

        for i = 1:length(links)
            link_id = links(i);

            start_block_id = get_start_block(model, link_id);
            start_block_name = get_name(model, start_block_id);
            start_block_port = get_start_port(model, link_id);

            end_block_id = get_end_block(model, link_id);
            end_block_name = get_name(model, end_block_id);
            end_block_port = get_end_port(model, link_id);

            start = sprintf('%s/%s', start_block_name, start_block_port);
            dest = sprintf('%s/%s', end_block_name, end_block_port);
            
            %fprintf('%s : %s -> %s\n', system_path, start, dest);
            add_line(system_path, start, dest, 'autorouting', 'smart');
        end
    end
end

function rearrange_model(model)
    import actport.model.Matlab.*

    % Automatic rearrangement of the system if there are children present.
    blocks = get_all_blocks(model);

    for i = 1:length(blocks)
        children = get_children(model, blocks(i));
        if ~isempty(children)
            block_path = get_path(model, blocks(i));
            try
                Simulink.BlockDiagram.arrangeSystem(block_path);
            catch e
                fprintf('\t[W] ignored layout warning\n');
            end
        end
    end
end
