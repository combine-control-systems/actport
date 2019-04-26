% activate = 'system/Hybrid/Quantization'
function out = actport_quatinzation(diagram, block)
    import actport.GeneratorApi.*

    block = addBlockExpr(block, 'simulink/Discontinuities/Quantizer');
    block = setParamExpr(block, 'QuantizationInterval', getParameter(block, 'step', '0.1'));

    %TODO: Several rounding methods in activate not available in Simulink. Maybe manual implementation

    block = addCommonProperties(block);
    out = updateDiagram(diagram, block);
end
