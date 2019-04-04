function [diagram, blockTag] = add_block_(diagram, block, blockName)
    import actport.ActivateApi.*
    result = add_block_impl(diagram, block, blockName);
    diagram = result(1);
    blockTag = result(2);
end
