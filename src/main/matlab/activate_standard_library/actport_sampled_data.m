% activate = 'system/Dynamical/SampledData'
function model = actport_sampled_data(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_clean_subsystem(block_path);

    % Continuous-time linear system
    cont_path = sprintf('%s/Cont', block_path);
    add_block('simulink/Continuous/State-Space', cont_path);
    set_param(cont_path, 'A', get_parameter(model, block_id, 'A', '-1'),...
                         'B', get_parameter(model, block_id, 'B', '1'),...
                         'C', get_parameter(model, block_id, 'C', '1'),...
                         'D', get_parameter(model, block_id, 'D', '0'),...
                         'X0', get_parameter(model, block_id, 'x0', '0'));

    % Discretization
    add_block('simulink/Discrete/Zero-Order Hold', sprintf('%s/Discr', block_path));

    logger(sprintf('Simulink does not support Conversion type for block %s', block_path));

    % I/O and routing
    add_block('simulink/Ports & Subsystems/In1', sprintf('%s/In1', block_path));
    add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block_path));
    add_line(block_path, 'In1/1', 'Cont/1');
    add_line(block_path, 'Cont/1', 'Discr/1');
    add_line(block_path, 'Discr/1', 'Out1/1');

    % Rearrange the blocks in the subsystem.
    Simulink.BlockDiagram.arrangeSystem(block_path);

    set_common_parameters(model, block_id, model_path);
end
