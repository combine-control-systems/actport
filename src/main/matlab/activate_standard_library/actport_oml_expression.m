% activate = 'system/MathOperations/OmlExpression'
function model = actport_oml_expression(model, block_id, model_path)
    import actport.model.Matlab.*

    name = char(get_name(model, block_id));
    block_path = sprintf('%s/%s', model_path, name);

    input_count = str2double(get_parameter(model, block_id, 'nin', '1'));

    expression = get_parameter(model, block_id, 'exx', '1');
    % Put indices in parentheses.
    expression = regexprep(expression, 'u(\d+)', 'u\($1\)');
    % Remove first and last quote.
    expression = regexprep(expression, '^''(.*)''$', '$1');

    if input_count == 1
        add_block('simulink/User-Defined Functions/Fcn', block_path);
        set_param(block_path, 'Expr', expression);
    else
        add_clean_subsystem(block_path);

        fcn_path = sprintf('%s/%s', block_path, 'Fcn');
        add_block('simulink/User-Defined Functions/Fcn', fcn_path);
        set_param(fcn_path, 'Expr', expression);

        for i = 1:input_count
            add_block('simulink/Sources/In1', sprintf('%s/In%d', block_path, i));
        end
        add_block('simulink/Sinks/Out1', sprintf('%s/Out1', block_path));

        mux_path = sprintf('%s/Mux', block_path);
        add_block('simulink/Signal Routing/Mux', mux_path);
        set_param(mux_path, 'Inputs', num2str(input_count));

        for i = 1:input_count
            add_line(block_path, sprintf('In%d/1', i), sprintf('Mux/%d', i));
        end
        add_line(block_path, 'Mux/1', 'Fcn/1');
        add_line(block_path, 'Fcn/1', 'Out1/1');

        Simulink.BlockDiagram.arrangeSystem(block_path);
    end

    set_common_parameters(model, block_id, model_path);
end
