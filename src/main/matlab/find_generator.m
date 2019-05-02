function f = find_generator(activateId)
    global ACTPORT_LIBRARY;
    fname = string(ACTPORT_LIBRARY.get(activateId, 'actport_undefined'));
    f = str2func(fname);
end
