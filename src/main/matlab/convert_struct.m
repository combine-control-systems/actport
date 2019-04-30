function struct_out = convert_struct(struct_in)
    struct_out = actport.ActivateStruct();
    keys = fieldnames(struct_in);
    for i = 1:length(keys)
        % Single character strings, e.g. 'A', becomes Char and not String by default.
        key = string(keys{i});
        value = struct_in.(key);
        if isstruct(value)
            value = convert_struct(value);
        end
        % Same for values as for keys. We want Strings and not Chars.
        if ischar(value)
            value = string(value);
        end
        struct_out.put(key, value);
    end
end
