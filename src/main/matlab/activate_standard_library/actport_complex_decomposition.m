% activate = 'system/SignalConversions/ComplexDecomposition'
function model = actport_complex_decomposition(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    ctor_mode = strcmp(char(get_parameter(model, block_id, 'decomptyp/CtoR', '1')), '2');
    rtoc_mode = strcmp(char(get_parameter(model, block_id, 'decomptyp/RtoC', '1')), '2');

    if ctor_mode
        add_block('simulink/Math Operations/Complex to Real-Imag', block_path);
    else if rtoc_mode
        add_block('simulink/Math Operations/Real-Imag to Complex', block_path);
    end

    set_common_parameters(model, block_id, model_path);
end
