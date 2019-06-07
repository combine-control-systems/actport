% activate = 'system/Routing/Extractor'
function model = actport_extractor(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    % Multiple outputs for a single index are not supported in Simulink
    add_clean_subsystem(block_path);

    nout = eval(get_parameter(model, block_id, 'nout', '1'));
    outs = get_parameter(model, block_id, 'extractor/index', {'[1]'});
    add_block('simulink/Ports & Subsystems/In1', sprintf('%s/In1', block_path));
    for i=1:nout
        sel = sprintf('Sel%i', i);
        out = sprintf('Out%i', i);
        % In Activate Matrixes are treated as 1-D vectors in this block
        reshape = sprintf('Reshape%i', i);
        sel_path = sprintf('%s/%s', block_path, sel);
        add_block('simulink/Math Operations/Reshape', sprintf('%s/%s', block_path, reshape));
        add_block('simulink/Signal Routing/Selector', sel_path);
        add_block('simulink/Ports & Subsystems/Out1', sprintf('%s/%s', block_path, out));
        add_line(block_path, 'In1/1', strcat(reshape, '/1'));
        add_line(block_path, strcat(reshape, '/1'), strcat(sel, '/1'));
        add_line(block_path, strcat(sel, '/1'), strcat(out, '/1'));

        % Configure Selector
        set_param(sel_path, 'NumberOfDimensions', '1');
        set_param(sel_path, 'InputPortWidth', '-1');
        set_param(sel_path, 'IndexOptionArray', {'Index vector (dialog)'});
        if strfind(outs(i), ';')
            logger(sprintf('Block %s: Simulink does not support rules which contain matrices', block_path));
            logger('A 1D array consisting of the concatenation of Activate''s output is returned');
            set_param(sel_path, 'IndexParamArray', {strrep(char(outs(i)), ';', ' ')});
        else
            set_param(sel_path, 'IndexParamArray', {char(outs(i))});
        end
    end

    % Rearrange the blocks in the subsystem.
    Simulink.BlockDiagram.arrangeSystem(block_path);

    set_common_parameters(model, block_id, model_path);
end
