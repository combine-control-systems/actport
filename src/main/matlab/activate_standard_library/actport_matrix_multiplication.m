% activate = 'system/MatrixOperations/MatrixMultiplication'
function model = actport_matrix_multiplication(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    signs = get_parameter(model, block_id, 'in_ports/sgn', {'''*''', '''/'''});
    signs = strjoin(string(signs), '');
    signs = strrep(signs, '''', '');
    signs = char(signs);

    % Handle "H" which is a conjugate-transposed input which is multiplied. Simulink
    % only has "*" and "/". We need to add transpose blocks before each input.
    if contains(signs, 'H')
        add_clean_subsystem(block_path);
        % Add product block.
        product_block_path = sprintf('%s/Product', block_path);
        add_block('simulink/Math Operations/Product', product_block_path);
        set_param(product_block_path, 'Multiplication', 'Matrix(*)');
        set_param(product_block_path, 'Inputs', strrep(signs, 'H', '*'));
        % Add output port.
        add_block(sprintf('%s/Out1', block_path));
        % Connect product block and output port.
        add_line(block_path, 'Product/1', 'Out1/1', 'autorouting', 'smart');
        % Generate inputs.
        for i = 1:length(signs)
            switch signs(i)
                case 'H'
                    % Input port.
                    add_block('simulink/Ports & Subsystems/In1', sprintf('%s/In%d', block_path, i));
                    % Hermitian transpose block.
                    transpose_path = sprintf('%s/Transpose%d', block_path, i);
                    add_block('simulink/Math Operations/Math Function', transpose_path);
                    set_param(transpose_path, 'Operator', 'hermitian');
                    % Connect port, transpose and product.
                    add_line(block_path, sprintf('In%d/1', i), sprintf('Transpose%d/1', i));
                    add_line(block_path, sprintf('Transpose%d/1', i), sprintf('Product/%d', i));
                case {'*', '/'}
                    % Input port.
                    add_block('simulink/Ports & Subsystems/In1', sprintf('%s/In%d', block_path, i));
                    % Connect port with product.
                    add_line(block_path, sprintf('In%d/1', 1), sprintf('Product/%d', i));
                otherwise
                    error(sprintf('Invalid matrix multiplication sign %s in %s', signs(i), signs));
            end
        end
        Simulink.BlockDiagram.arrangeSystem(block_path);
    else
        add_block('simulink/Math Operations/Product', block_path);
        set_param(block_path, 'Multiplication', 'Matrix(*)');
        set_param(block_path, 'Inputs', signs);
    end

    set_common_parameters(model, block_id, model_path);
end
