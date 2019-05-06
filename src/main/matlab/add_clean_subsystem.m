function add_clean_subsystem(block_path)
    add_block('simulink/Ports & Subsystems/Subsystem', block_path);
    delete_line(block_path, 'In1/1', 'Out1/1');
    delete_block(sprintf('%s/In1', block_path));
    delete_block(sprintf('%s/Out1', block_path));
end
