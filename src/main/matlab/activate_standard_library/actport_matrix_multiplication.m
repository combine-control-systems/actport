% activate = 'system/MatrixOperations/MatrixMultiplication'
function out = actport_matrix_multiplication(diagram, block)
    import actport.GeneratorApi.*

    signs = getParameter(block, 'in_ports/sgn', {'''*''', '''/'''});
    signs = strjoin(string(signs), '');
    signs = strrep(signs, '''', '');
    signs = char(signs);

    % Handle "H" which is a conjugate-transposed input which is multiplied. Simulink
    % only has "*" and "/". We need to add transpose blocks before each input.
    if contains(signs, 'H')
        block = addCleanSubSystemExpr(block);
        % Add product block.
        block = addBlockExpr(block, 'simulink/Math Operations/Product', sprintf('%s/Product', block.name));
        block = setParamExpr(block, sprintf('%s/Product', block.name), 'Inputs', strrep(signs, 'H', '*'));
        % Add output port.
        block = addBlockExpr(block, 'simulink/Ports & Subsystems/Out1', sprintf('%s/Out1', block.name));
        % Connect product block and output port.
        block = addLineExpr(block, block.name, 'Product/1', 'Out1/1');
        % Generate inputs.
        for i = 1:length(signs)
            switch signs(i)
                case 'H'
                    % Input port.
                    block = addBlockExpr(block, 'simulink/Ports & Subsystems/In1', sprintf('%s/In%d', block.name, i));
                    % Hermitian transpose block.
                    block = addBlockExpr(block, 'simulink/Math Operations/Math Function', ...
                        sprintf('%s/Transpose%d', block.name, i));
                    block = setParamExpr(block, sprintf('%s/Transpose%d', block.name, i), 'Operator', 'hermitian');
                    % Connect port, transpose and product.
                    block = addLineExpr(block, block.name, sprintf('In%d/1', i), sprintf('Transpose%d/1', i));
                    block = addLineExpr(block, block.name, sprintf('Transpose%d/1', i), sprintf('Product/%d', i));
                case {'*', '/'}
                    % Input port.
                    block = addBlockExpr(block, 'simulink/Ports & Subsystems/In1', sprintf('%s/In%d', block.name, i));
                    % Connect port with product.
                    block = addLineExpr(block, block.name, sprintf('In%d/1', i), sprintf('Product/%d', i));
                otherwise
                    error(sprintf('Invalid matrix multiplication sign %s in %s', signs(i), signs));
            end
        end
    else
        block = addBlockExpr(block, 'simulink/Math Operations/Product');
        block = setParamExpr(block, 'Multiplication', 'Matrix(*)');
        block = setParamExpr(block, 'Inputs', signs);
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
