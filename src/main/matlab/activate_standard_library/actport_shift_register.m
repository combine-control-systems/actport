% activate = 'system/Dynamical/ShiftRegister'
function model = actport_shift_register(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/User-Defined Functions/MATLAB Function', block_path);

    % TODO: This implementation needs to be tested more thoroughly.

    queue_length = char(get_parameter(model, block_id, 'K', '3'));
    queue_init = char(get_parameter(model, block_id, 'z0', '[0,0,0]'));

    sf = sfroot;
    block = sf.find('Path', block_path, '-isa', 'Stateflow.EMChart');
    block.Script = sprintf([
        'function y = f(u)\n'...
        '%%#codegen\n'...
        'persistent queue;\n'...
        'if isempty(queue)\n'...
        '    queue = %s;\n'...
        'end\n'...
        'y = queue(1);\n'...
        'queue(1:end-1) = queue(2:end);\n'...
        'queue(end) = u;\n'...
    ], queue_init);

    set_common_parameters(model, block_id, model_path);
end
