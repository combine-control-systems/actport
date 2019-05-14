% activate = 'system/ActivationOperations/ZeroCross'
function model = actport_zero_cross(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_clean_subsystem(block_path);

    % Building something based on https://stackoverflow.com/a/50907124/4435991.

    sign_path = sprintf('%s/Sign', block_path);
    add_block('simulink/Math Operations/Sign', sign_path);

    saturation_path = sprintf('%s/Saturation', block_path);
    add_block('simulink/Discontinuities/Saturation', saturation_path);
    set_param(saturation_path, 'UpperLimit', '1');
    set_param(saturation_path, 'LowerLimit', '0');

    product_path = sprintf('%s/Product', block_path);
    add_block('simulink/Math Operations/Product', product_path);

    add_path = sprintf('%s/Add', block_path);
    add_block('simulink/Math Operations/Add', add_path);

    constant_minus_one_path = sprintf('%s/ConstantMinus', block_path);
    add_block('simulink/Sources/Constant', constant_minus_one_path);

    constant_plus_one_path = sprintf('%s/ConstantPlus', block_path);
    add_block('simulink/Sources/Constant', constant_plus_one_path);

    change_detect_path = sprintf('%s/Change', block_path);
    add_block('simulink/Logic and Bit Operations/Detect Change', change_detect_path);

    input_path = sprintf('%s/Input', block_path);
    add_block('simulink/Ports & Subsystems/In1', input_path);

    output_path = sprintf('%s/Output', block_path);
    add_block('simulink/Ports & Subsystems/Out1', output_path);

    add_line(block_path, 'Input/1', 'Sign/1');
    add_line(block_path, 'Sign/1', 'Saturation/1');
    add_line(block_path, 'Saturation/1', 'Product/2');
    add_line(block_path, 'ConstantMinus/1', 'Product/1');
    add_line(block_path, 'ConstantPlus/1', 'Add/1');
    add_line(block_path, 'Product/1', 'Add/2');
    add_line(block_path, 'Add/1', 'Change/1');
    add_line(block_path, 'Change/1', 'Output/1');

    Simulink.BlockDiagram.arrangeSystem(block_path);
end
