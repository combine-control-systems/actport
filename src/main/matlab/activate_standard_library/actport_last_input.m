% activate = 'system/Hybrid/LastInput'
function model = actport_last_input(model, block_id, model_path)
        import actport.model.Matlab.*

        name = get_name(model, block_id);
        block_path = sprintf('%s/%s', model_path, name);

        external_activation = get_parameter(model, block_id, 'externalActivation', '0');

        if strcmp(external_activation, '1')
            add_block('simulink/Discrete/Delay', block_path);
            set_param(block_path, 'DelayLength', '1');
            set_param(block_path, 'SampleTime', '-1');
        else
            add_block('simulink/Discrete/Memory', block_path);
        end

        set_common_parameters(model, block_id, model_path);
end
