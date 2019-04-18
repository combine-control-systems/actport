function f = findGenerator(block)
    global ACTPORT_LIBRARY;
    fname = string(ACTPORT_LIBRARY.get(block.blockType, 'actport_undefined'));
    f = str2func(fname);
end
