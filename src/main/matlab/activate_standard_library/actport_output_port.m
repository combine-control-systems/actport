% activate = 'system/Ports/Output'
function model = actport_output_port(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);

    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Ports & Subsystems/Out1', block_path);
    set_param(block_path, 'Port', get_parameter(model, block_id, 'portNumber', '1'));

    set_common_parameters(model, block_id, model_path);
end
