function [system, blockTag] = add_block_2(system, block, blockName)
    import actport.oml.Matlab.add_block_impl;
    system = add_block_impl(system, block, blockName);
    blockTag = blockName;
end
