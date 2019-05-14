% activate = 'system/SignalViewers/ScopeXY'
function model = actport_scopexy(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Sinks/XY Graph', block_path);

    x_interval = eval(get_parameter(model, block_id, 'xInterval', '[-1,1]'));
    set_param(block_path, 'xmin', num2str(x_interval(1)));
    set_param(block_path, 'xmax', num2str(x_interval(2)));

    y_interval = eval(get_parameter(model, block_id, 'yInterval', '[-1,1]'));
    set_param(block_path, 'ymin', num2str(y_interval(1)));
    set_param(block_path, 'ymax', num2str(y_interval(2)));

    set_common_parameters(model, block_id, model_path);
end
