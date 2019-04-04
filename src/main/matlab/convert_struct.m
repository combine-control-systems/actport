function sout = convert_struct(sin)
    sout = actport.ActivateStruct();
    keys = fieldnames(sin);
    for i = 1:length(keys)
        key = keys{i};
        value = sin.(key);
        if isstruct(value)
            value = convert_struct(value);
        end
        sout.put(key, value);
    end
end
