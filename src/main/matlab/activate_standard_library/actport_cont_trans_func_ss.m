% activate = 'system/AdvancedDynamical/ContTransFunc_SS'
function model = actport_cont_trans_func_ss(model, block_id, model_path)
    import actport.model.Matlab.*

    logger("Block ContTransFunc_SS is not supported by Simulink. Block ContTransFunc will be used instead");
    actport_cont_trans_func(model, block_id, model_path);
end
