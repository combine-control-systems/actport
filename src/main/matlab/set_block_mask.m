function blk = set_block_mask(blk, params, label)
    import actport.oml.Matlab.*
    s = convert_struct(params);
    set_block_mask_impl(blk, s, label);
end
