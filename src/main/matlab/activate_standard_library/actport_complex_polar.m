% activate = 'system/SignalConversions/ComplexToPolar'
function model = actport_cartesian_polar(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    ctop_mode = strcmp(char(get_parameter(model, block_id, 'decomptyp/CtoP', '1')), '2');
    ptoc_mode = strcmp(char(get_parameter(model, block_id, 'decomptyp/PtoC', '1')), '2');

    if ctop_mode
        add_block('simulink/Math Operations/Complex to Magnitude-Angle', block_path);
    else if ptoc_mode
        add_block('simulink/Math Operations/Magnitude-Angle to Complex', block_path);
    end

    set_common_parameters(model, block_id, model_path);
end
