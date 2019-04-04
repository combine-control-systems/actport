function blk = set_block_parameters(blk, params)
    import actport.ActivateApi.*
    blk = set_block_parameters_impl(blk, convert_struct(params));
end
