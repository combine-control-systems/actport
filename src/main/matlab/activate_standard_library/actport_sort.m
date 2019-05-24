% activate = 'system/MatrixOperations/Sort
function model = actport_sort(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/User-Defined Functions/MATLAB Function', block_path);
    logger("Simulink does not support 'Sorting method' for matrix sorting");

    order = strrep(get_parameter(model, block_id, 'incdec', '''Ascending'''), '''', '');
    switch order
        case 'Ascending'
            order = 'ascend';
        case 'Descending'
            order = 'descend';
    end

    method = strrep(get_parameter(model, block_id, 'cmplx', '''Magnitude'''), '''', '');
    switch method
        case 'Magnitude'
            method = 'abs';
        case 'Real, part'
            method = 'real';
        case 'Complex, part'
            logger("Sorting according to complex part is not supported. Using magnitude");
            method = 'abs';
    end

    sf = sfroot();
    block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
    if strcmp(get_parameter(model, block_id, 'indexoutput', '0'), '0')
        block.Script = sprintf([...
            'function y = f(x)\n'...
            '%%#codegen\n'...
            'sz = size(x);\n'...
            'A = x(:);\n'...
            'if isreal(x)\n'...
            'y = reshape(sort(A, ''%s''), sz);\n'...
            'else\n'...
            'y = reshape(sort(A, ''%s'', ''ComparisonMethod'', ''%s''), sz);\n'...
            'end\n'...
            'end\n'...
        ], order, order, method);
    else
        onebased = str2double(get_parameter(model, block_id, 'onebased', '0'));
        block.Script = sprintf([
            'function [y, i] = f(x)\n'...
            '%%#codegen\n'...
            'sz = size(x);\n'...
            'A = x(:);\n'...
            'if isreal(x)\n'...
            '[z, j] = sort(A, ''%s'');\n'...
            'y = reshape(z, sz);\n'...
            'i = reshape(j, sz);\n'...
            'else\n'...
            '[z, j] = sort(A, ''%s'', ''ComparisonMethod'', ''%s'');\n'...
            'y = reshape(z, sz);\n'...
            'i = reshape(j, sz);\n'...
            'end\n'...
            'i = i + %i;\n'...
            'end\n'...
        ], order, order, method, onebased-1);
    end

    set_common_parameters(model, block_id, model_path);
end