function [diagram, blockTag] = add_block_2(diagram, block, blockName)
    f = findGenerator(block);
    diagram = f(diagram, block, blockName);
    blockTag = blockName;
end
