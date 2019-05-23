% activate = 'system/ActivationOperations/EventClock'
function model = actport_event_clock(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    period = char(get_parameter(model, block_id, 'period', '0.1'));
    init = char(get_parameter(model, block_id, 'init', '0'));

    if strcmp(init, '0')
        add_block('simulink/Sources/Pulse Generator', block_path);
        set_param(block_path, 'Period', sprintf('2*(%s)', period));
        set_param(block_path, 'PulseWidth', '50');
        set_param(block_path, 'PhaseDelay', init);
    else
        add_clean_subsystem(block_path);
        pulse_path = sprintf('%s/Pulse', block_path);
        add_block('simulink/Sources/Pulse Generator', pulse_path);
        set_param(pulse_path, 'Period', sprintf('2*(%s)', period));
        set_param(pulse_path, 'PulseWidth', '50');
        set_param(pulse_path, 'PhaseDelay', init);

        product_path = sprintf('%s/Product', block_path);
        add_block('simulink/Math Operations/Product', product_path);

        step_path = sprintf('%s/Step', block_path);
        add_block('simulink/Sources/Step', step_path);
        set_param(step_path, 'Time', init);

        add_block('simulink/Sinks/Out1', sprintf('%s/Out', block_path));

        add_line(block_path, 'Pulse/1', 'Product/1');
        add_line(block_path, 'Step/1', 'Product/2');
        add_line(block_path, 'Product/1', 'Out/1');

        Simulink.BlockDiagram.arrangeSystem(block_path);
    end

    model = swap_width_and_height(model, block_id);
    model = rotate_clockwise(model, block_id);

    set_common_parameters(model, block_id, model_path);
end
