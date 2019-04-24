% activate = 'TEXT_f'
function out = actport_annotation(diagram, block)
    import actport.GeneratorApi.*

    text = getParameter(block, 'txt', 'No text...');
    block = addAnnotationExpr(block, text);
    out = updateDiagram(diagram, block);
end
