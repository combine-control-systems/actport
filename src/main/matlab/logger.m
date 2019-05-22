function logger(msg, block_path)
    import actport.Logger.log
    if nargin == 1
        log(msg);
    else
        log(sprintf('%s (%s)', msg, block_path));
    end
end
