% activate = 'system/SignalConversions/CartesianToPolar'
function model = actport_cartesian_polar(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    ctop_mode = strcmp(char(get_parameter(model, block_id, 'convtyp/CtoP', '0')), '1');
    ptoc_mode = strcmp(char(get_parameter(model, block_id, 'convtyp/PtoC', '0')), '1');

    if ctop_mode
        add_block('simulink_extras/Transformations/Cartesian to Polar', block_path);
    else if ptoc_mode
        add_block('simulink_extras/Transformations/Polar to Cartesian', block_path);
    end

    set_common_parameters(model, block_id, model_path);
end
