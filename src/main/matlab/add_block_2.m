function [diagram, blockTag] = add_block_2(diagram, block, blockName)
    import actport.GeneratorApi.setBlockName;
    block = setBlockName(block, blockName);
    f = findGenerator(block);
    diagram = f(diagram, block);
    blockTag = blockName;
end
