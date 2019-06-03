% activate = 'system/LogicalOperations/TruthTable'
function model = actport_truth_table(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    logger(sprintf('In order for %s to simulate, booleans need to implemented as doubles in Simulation options', block_path));
    % Simulink has one input and one output of vector type, while in Activate they are demuxed
    add_clean_subsystem(block_path);

    mux_path = sprintf('%s/Mux', block_path);
    add_block('simulink/Signal Routing/Mux', mux_path);
    nin = get_parameter(model, block_id, 'nin', '2');
    set_param(mux_path, 'Inputs', nin);

    demux_path = sprintf('%s/Demux', block_path);
    add_block('simulink/Signal Routing/Demux', demux_path);
    nout = get_parameter(model, block_id, 'nout', '1');
    set_param(demux_path, 'Outputs', nout);

    table_path = sprintf('%s/Table', block_path);
    add_block('simulink/Logic and Bit Operations/Combinatorial  Logic', table_path);
    set_param(table_path, 'TruthTable', get_parameter(model, block_id, 'mat', '[0; 0; 0; 1]'));

    % Route Table
    add_line(block_path, 'Mux/1', 'Table/1');
    add_line(block_path, 'Table/1', 'Demux/1');

    nout = str2double(nout);
    % Route Demux and outputs
    for i=1:nout
        add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/Out%i', block_path, i));
        add_line(block_path, sprintf('Demux/%i', i), sprintf('Out%i/1', i));
    end

    % Route Mux and input. Simulink and Activate route the table in the opposite way.
    % In consequence, the input routing has to be swapped
    nin = str2double(nin);
    for i=1:nin
        add_block('simulink/Ports & Subsystems/In1', sprintf('%s/In%i', block_path, i));
        add_line(block_path, sprintf('In%i/1', i), sprintf('Mux/%i', nin + 1 - i));
    end

    % Rearrange the blocks in the subsystem.
    Simulink.BlockDiagram.arrangeSystem(block_path);

    set_common_parameters(model, block_id, model_path);
end