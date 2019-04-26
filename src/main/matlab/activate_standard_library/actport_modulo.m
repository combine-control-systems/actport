% activate = 'system/MathOperations/Modulo'
function out = actport_modulo(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
    op = getParameter(block, 'op', 'Modulo');
    if strcmp(op, 'Modulo')
        block = setParamExpr(block, 'Operator', 'mod');
    else
        block = setParamExpr(block, 'Operator', 'rem');
    end

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
