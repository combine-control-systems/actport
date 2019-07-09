% activate = 'system/Buffers/MaxMinInterval'
function model = actport_max_min_interval(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/User-Defined Functions/MATLAB Function', block_path);

    % TODO: Reinitialization is not supported.

    min_or_max = strrep(char(get_parameter(model, block_id, 'mm', 'Max')), '''', '');
    initial = char(get_parameter(model, block_id', 'initial', '0.0'));

    switch min_or_max
        case 'Max'
            operator = '>';
        case 'Min'
            operator = '<';
    end

    sf = sfroot;
    block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
    block.Script = sprintf([...
        'function y = f(u)\n'...
        '%%#codegen\n'...
        'persistent v;\n'...
        'if isempty(v)\n'...
        '    v = %s;\n'...
        'end\n'...
        'if u %s v\n'...
        '    v = u;\n'...
        'end\n'...
        'y = v;\n'...
        'end\n'
    ], initial, operator);

    set_common_parameters(model, block_id, model_path);
end
