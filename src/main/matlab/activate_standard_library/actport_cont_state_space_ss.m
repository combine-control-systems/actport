% activate = 'system/AdvancedDynamical/ContStateSpace_SS'
function model = actport_cont_state_space_ss(model, block_id, model_path)
    import actport.model.Matlab.*

    logger("Block ContStateSpace_SS is not supported by Simulink. Block ContStateSpace will be used instead");
    actport_cont_state_space(model, block_id, model_path);
end
