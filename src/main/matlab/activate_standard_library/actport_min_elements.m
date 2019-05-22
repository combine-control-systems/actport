% activate = 'system/MatrixOperations/MinElements'
function model = actport_min_elements(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    % Simulink does not allow minimum over matrices rows.
    % To avoid the MATLAB function different selector patterns could be used, but it complicates the solution
    add_block('simulink/User-Defined Functions/MATLAB Function', block_path);
    sf = sfroot();
    block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
    switch get_parameter(model, block_id, 'decomptyp', '''All''')
        case '''All'''
            if strcmp(get_parameter(model, block_id, 'mindex', '0'), '0')
                block.Script = sprintf([...
                        'function y = f(u)\n'...
                        '%%#codegen\n'...
                        'y = min(u, [], "all");\n'...
                        'end\n'...
                ]);
            else
                block.Script = sprintf([...
                        'function [y, n] = f(u)\n'...
                        '%%#codegen\n'...
                        '[y, n] = min(u, [], "all");\n'...
                        'end\n'...
                ]);
            end
        case '''Rows'''
            if strcmp(get_parameter(model, block_id, 'mindex', '0'), '0')
                block.Script = sprintf([...
                        'function y = f(u)\n'...
                        '%%#codegen\n'...
                        'y = min(u, [], 2);\n'...
                        'end\n'...
                ]);
            else
                block.Script = sprintf([...
                        'function [y, n] = f(u)\n'...
                        '%%#codegen\n'...
                        '[y, n] = min(u, [], 2);\n'...
                        'end\n'...
                ]);
            end
        case '''Columns'''
            if strcmp(get_parameter(model, block_id, 'mindex', '0'), '0')
                block.Script = sprintf([...
                        'function y = f(u)\n'...
                        '%%#codegen\n'...
                        'y = min(u, [], 1);\n'...
                        'end\n'...
                ]);
            else
                block.Script = sprintf([...
                        'function [y, n] = f(u)\n'...
                        '%%#codegen\n'...
                        '[y, n] = min(u, [], 1);\n'...
                        'end\n'...
                ]);
            end
        otherwise
            logger('Unknown Min along parameter', block_path);
    end

    if not(strcmp(get_parameter(model, block_id, 'externalActivation', '0'), '0'))
        logger("External activation is not implemented in Simulink", block_path);
    end

    set_common_parameters(model, block_id, model_path);
end
