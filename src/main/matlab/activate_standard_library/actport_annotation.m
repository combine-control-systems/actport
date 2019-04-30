% activate = 'TEXT_f'
function out = actport_annotation(system, block)
    import actport.GeneratorApi.*

    text = getParameter(block, 'txt', 'No text...');
    block = addAnnotationExpr(block, text);
    out = updateSystem(system, block);
end
