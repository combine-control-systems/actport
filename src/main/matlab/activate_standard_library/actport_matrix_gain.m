% activate = 'system/MatrixOperations/MatrixGain'
function model = actport_matrix_gain(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Gain', block_path);
    set_param(block_path, 'Gain', get_parameter(model, block_id, 'gain', '1.0'));

    switch get_parameter(model, block_id, 'overflow', '''Nothing''')
        case '''Saturate'''
            set_param(block_path, 'SaturateOnIntegerOverflow', 'on');
        case '''Nothing'''
            set_param(block_path, 'SaturateOnIntegerOverflow', 'off');
        % TODO: Handle "Error" case properly.
        case '''Error'''
            set_param(block_path, 'SaturateOnIntegerOverflow', 'off');
        otherwise
            set_param(block_path, 'SaturateOnIntegerOverflow', 'off');
    end

    switch get_parameter(model, block_id, 'mulmethod', '''Gain*u1''')
        case '''Gain.*u1'''
            set_param(block_path, 'Multiplication', 'Element-wise(K.*u)');
        case '''Gain*u1'''
            set_param(block_path, 'Multiplication', 'Matrix(K*u)');
        case '''u1*Gain'''
            set_param(block_path, 'Multiplication', 'Matrix(u*K)');
        otherwise
            set_param(block_path, 'Multiplication', 'Matrix(K*u)');
    end

    set_common_parameters(model, block_id, model_path);
end
