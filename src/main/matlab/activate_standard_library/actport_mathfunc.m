% activate = 'system/MathOperations/MathFunc'
function model = actport_mathfunc(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    func = strrep(get_parameter(model, block_id, 'func', 'exp'), '''', '');

    switch func
        case 'exp'
            add_block('simulink/Math Operations/Math Function', block_path);
            set_param(block_path, 'Operator', 'exp');
        case 'log'
            add_block('simulink/Math Operations/Math Function', block_path);
            set_param(block_path, 'Operator', 'log');
        case '10^u'
            add_block('simulink/Math Operations/Math Function', block_path);
            set_param(block_path, 'Operator', '10^u');
        case '|u|'
            add_block('simulink/Math Operations/Abs', block_path);
        case 'u^2'
            add_block('simulink/Math Operations/Math Function', block_path);
            set_param(block_path, 'Operator', 'square');
        case 'sqrt'
            add_block('simulink/Math Operations/Sqrt', block_path);
        case '1/u'
            add_block('simulink/Math Operations/Math Function', block_path);
            set_param(block_path, 'Operator', 'reciprocal');
        case 'conj'
            add_block('simulink/Math Operations/Math Function', block_path);
            set_param(block_path, 'Operator', 'conj');
        case '|u|^2'
            add_block('simulink/Math Operations/Math Function', block_path);
            set_param(block_path, 'Operator', 'magnitude^2');
        case 'log2'
            % There is no log2 available, so we calculate using log(x)/log(2)
            add_block('simulink/User-Defined Functions/MATLAB Function', block_path);
            sf = sfroot();
            block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
            block.Script = sprintf([...
                'function y = f(x)\n'...
                '%%#codegen\n'...
                'y = log(x)/log(2);\n'...
                'end\n'...
            ]);
        case 'log10'
            add_block('simulink/User-Defined Functions/MATLAB Function', block_path);
            sf = sfroot();
            block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
            block.Script = sprintf([...
                'function y = f(x)\n' ...
                '%%#codegen\n'...
                'y = log10(x);\n'...
                'end\n'...
            ]);
        case 'erf'
            % There is no erf in Simulink and we have to resort to Matlab.
            add_block('simulink/User-Defined Functions/MATLAB Function', block_path);
            sf = sfroot();
            block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
            block.Script = sprintf([...
                'function y = f(x)\n'...
                '%%#codegen\n'...
                'y = erf(x);\n'...
                'end\n'...
            ]);
        case 'erfc'
            % There is no erfc in Simulink and we have to resort to Matlab.
            add_block('simulink/User-Defined Functions/MATLAB Function', block_path);
            sf = sfroot();
            block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
            block.Script = sprintf([...
                'function y = f(x)\n'...
                '%%#codegen\n'...
                'y = erf(x);\n'...
                'end\n'...
            ]);
        case '2^u'
            add_block('simulink/User-Defined Functions/MATLAB Function', block_path);
            sf = sfroot();
            block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
            block.Script = sprintf([...
                'function y = f(x)\n'...
                '%%#codegen\n'...
                'y = 2.^x;\n'...
                'end\n'...
            ]);
        case 'round'
            add_block('simulink/Math Operations/Rounding Function', block_path);
            set_param(block_path, 'Operator', 'round');[]
        case 'floor'
            add_block('simulink/Math Operations/Rounding Function', block_path);
            set_param(block_path, 'Operator', 'floor');
        case 'ceil'
            add_block('simulink/Math Operations/Rounding Function', block_path);
            set_param(block_path, 'Operator', 'ceil');
        case 'int'
            add_block('simulink/Math Operations/Rounding Function', block_path);
            set_param(block_path, 'Operator', 'fix');
        otherwise
            model = actport_undefined(model, block_id, model_path);
    end

    set_common_parameters(model, block_id, model_path);
end
