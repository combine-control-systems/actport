function model = evaluate_model(system)
    % Perform evaluation of model.
    import actport.model.Matlab.*

    model = create_model(system);
    target_path = getenv('ACTPORT_TARGET_PATH');

    % Apply model transformations.
    logger('Applying model transformations.');
    model = apply_transformations(model);

    model_name = string(get_name(model, 0));

    logger(sprintf('Creating new Simulink system: %s.', model_name));
    try
        new_system(model_name);
        open_system(model_name);
    catch e
        logger(sprintf('Failed to create new system: %s.', e.message));
        return;
    end

    % Set root context.
    context = char(get_context(model, 0));
    if ~isempty(context)
        set_param(model_name, 'InitFcn', context);
    end

    % Create folder structure for model.
    logger('Creating folder structure.');
    warning('off', 'MATLAB:MKDIR:DirectoryExists');
    mkdir(fullfile(target_path, model_name, 'include'));
    mkdir(fullfile(target_path, model_name, 'src'));
    warning('on', 'MATLAB:MKDIR:DirectoryExists');

    % Add blocks.
    logger('Adding blocks to system.');
    model = add_blocks(model, 0, model_name);

    % Post add blocks transformations.
    logger('Applying post block model transformations.');
    model = apply_post_blocks_transformations(model);

    % Add links.
    logger('Adding links.');
    model = add_links(model);

    % Arrange model.
    logger('Automatically rearranging model.');
    rearrange_model(model);

    logger('Setting model parameters.');
    set_model_parameters(model);

    % Save model.
    logger('Saving system.');
    save_system(model_name, fullfile(target_path, model_name, model_name));

    if getenv('JENKINS_HOME')
	logger('Setting Scopes to log data for testing.');
	scopes = find_system(model_name, 'BlockType', 'Scope');
	for i = 1:length(scopes)
	    set_param(scopes{i}, 'DataLogging', 'on');
	    set_param(scopes{i}, 'DataLoggingSaveFormat', 'Structure With Time');
	    set_param(scopes{i}, 'DataLoggingVariableName',...
		      regexprep(get_param(scopes{i}, 'Name'), '[ -]', '_'));
	end
	save_system(model_name, fullfile(target_path, model_name, model_name));
	close_system(model_name);
    end

    % Now we can move the log file to the correct location.
    new_log_path = fullfile(target_path, model_name, 'actport.log');
    logger(sprintf('Moving logfile to %s.', new_log_path));
    movefile(fullfile(target_path, sprintf('actport_%s.log', model_name)), new_log_path);
end

function model = apply_transformations(model)
    import actport.model.transform.Matlab.*
    logger('Removing split blocks.');
    model = remove_split_blocks(model);
    logger('Eliminating SampleClock blocks.');
    model = eliminate_sample_clock_blocks(model);
    logger('Mapping event ports.');
    model = map_event_ports(model);
end

function model = apply_post_blocks_transformations(model)
    import actport.model.transform.Matlab.*
    logger('Removing invalid links.');
    model = remove_invalid_links(model);
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
            try
                add_line(system_path, start, dest, 'autorouting', 'smart');
            catch e
                logger(sprintf('Failed to add line in %s between %s and %s.', system_path, start, dest));
            end
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
            block_path = char(get_path(model, blocks(i)));
            try
                Simulink.BlockDiagram.arrangeSystem(block_path);
            catch e
                logger(sprintf('Ignored layout warning for %s.', block_path));
            end
        end
    end
end

function set_model_parameters(model)
    import actport.model.Matlab.*

    name = char(get_name(model, 0));

    set_param(name, 'StartTime', char(get_initial_time(model)));
    set_param(name, 'StopTime', char(get_final_time(model)));
    set_param(name, 'AbsTol', char(get_absolute_tolerance(model)));
    set_param(name, 'RelTol', char(get_relative_tolerance(model)));
    set_param(name, 'ConsecutiveZCsStepRelTol', char(get_tolerance_on_time(model)));
    set_param(name, 'MaxStep', char(get_max_step_size(model)));

    %       'VariableStepDiscrete' | {'ode45'} | 'ode23' | 'ode113' | 'ode15s' | 'ode23s' | 'ode23t'
    %       | 'ode23tb' | 'FixedStepDiscrete' |'ode8'| 'ode5' | 'ode4' | 'ode3' | 'ode2' | 'ode1' | 'ode14x'
    %
    % In Activate we have:
    %
    %                                      GUI-name | key
    % ----------------------------------------------+----------------------
    %                                         LSODA | lsodar
    %                              CVODE-BDF-NEWTON | cvode1
    %                          CVODE-BDF-Functional | cvode2
    %                            CVODE-ADAMS-NEWTON | cvode3
    %                        CVODE-ADAMS-Functional | cvode4
    %                               Radau-IIA (ODE) | radauv_exp
    %                                Backward Euler | euler_imp
    %                            Implicit Trapezoid | trapezoid_imp
    %                        Dopri (Dormand-Prince) | dopri5
    %           Runge-Kutta (Fixed step. 5th Order) | rk5
    % Classical Runge-Kutta (Fixed step. 4th Order) | rk4
    %                                 Forward Euler | euler_exp
    %                          Explicit Trapezoidal | trapezoid
    %                   CPode (ODE with constraint) | cpodes1
    %                                Ida (Sundials) | ida        (can have algebraic solvers Ida, Daskr or Fsolve)
    %                               Radau-IIA (DAE) | radauv_imp (can have algebraic solvers Ida, Daskr or Fsolve)
    %                                         DASKR | daskr      (can have algebraic solvers Ida, Daskr or Fsolve)

    % Default.
    solver = 'VariableStepAuto';

    activate_solver = char(get_solver(model));
    switch activate_solver
        % Variable-step stiff ODE
        case {'lsodar', 'cvode1', 'cvode3', 'radauv_imp', 'cpodes1'}
            solver = 'ode15s';
        % Variable-step non-stiff ODE
        case {'cvode2', 'cvode4', 'dopri5'}
            solver = 'ode45';
        % Variable-step DAE
        case {'ida', 'radauv_imp', 'daskr'}
            solver = 'ode15s';
        % Fixed step-size stiff ODE
        case {'euler_imp', 'trapezoid_imp'}
            solver = 'ode23tb';
        case {'euler_exp', 'trapezoid', 'rk4', 'rk5'}
            solver = 'ode5';
    end

    logger(sprintf('Choosing Simulink Solver ''%s'' given Activate Solver ''%s''.', ...
        solver, activate_solver));
end
