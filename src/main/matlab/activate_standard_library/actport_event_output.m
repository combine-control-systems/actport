% activate = 'system/Ports/EventOutput'
function model = actport_event_input(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);

    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Ports & Subsystems/Out1', block_path);
    % We assume that all port numbers have been corrected in an earlier model transformation step.
    % Hence, we do not need to calculate a new port number here.
    set_param(block_path, 'Port', get_parameter(model, block_id, 'portNumber', '1'));

    model = rotate_clockwise(model, block_id);
    set_common_parameters(model, block_id, model_path);
end
