function model = evaluate_model(system)
    % Perform evaluation of model.
    import actport.model.Matlab.*

    model = create_model(system);

    % Apply model transformations.
    fprintf('* Applying model transformations.\n');
    model = apply_transformations(model);

    model_name = string(get_name(model, 0));

    fprintf('* Creating new Simulink system.\n', model_name);
    new_system(model_name);
    open_system(model_name);

    % Add blocks and links.
    fprintf('* Adding blocks and links to system.\n');
    model = process_parent(model, 0, model_name);
end

function model = apply_transformations(model)
    import actport.model.transform.Matlab.*
    model = remove_split_blocks(model);
end

function model = process_parent(model, parentId, model_path)
    import actport.model.Matlab.*

    % Add blocks.
    children = get_children(model, parentId);
    for i = 1:length(children)
        id = children(i);
        activateId = string(get_activate_id(model, id));
        f = find_generator(activateId);
        model = f(model, id, model_path);
        model = process_parent(model, id, sprintf('%s/%s', model_path, get_name(model, id)));
    end

    % Add links.
    links = get_links(model, parentId);
    for i = 1:length(links)
        link_id = links(i);

        start_block_id = get_start_block(model, link_id);
        start_block_name = get_name(model, start_block_id);
        start_block_port = get_start_port(model, link_id);

        end_block_id = get_end_block(model, link_id);
        end_block_name = get_name(model, end_block_id);
        end_block_port = get_end_port(model, link_id);

        add_line(model_path, ...
            sprintf('%s/%s', start_block_name, start_block_port), ...
            sprintf('%s/%s', end_block_name, end_block_port), ...
            'autorouting', 'smart');
    end

    % Automatic rearrangement of the system if there are children present.
    if length(children) > 0
        try
            Simulink.BlockDiagram.arrangeSystem(model_path);
        catch e
            fprintf('\t[W] ignored layout warning\n');
        end
    end
end
