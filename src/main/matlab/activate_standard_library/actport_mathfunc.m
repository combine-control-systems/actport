% activate = 'system/MathOperations/MathFunc'
function out = actport_mathfunc(system, block)
    import actport.GeneratorApi.*

    func = strrep(getParameter(block, 'func', 'exp'), '''', '');

    switch func
        case 'exp'
            block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
            block = setParamExpr(block, 'Operator', 'exp');
        case 'log'
            block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
            block = setParamExpr(block, 'Operator', 'log');
        case '10^u'
            block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
            block = setParamExpr(block, 'Operator', '10^u');
        case '|u|'
            block = addBlockExpr(block, 'simulink/Math Operations/Abs');
        case 'u^2'
            block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
            block = setParamExpr(block, 'Operator', 'square');
        case 'sqrt'
            block = addBlockExpr(block, 'simulink/Math Operations/Sqrt');
        case '1/u'
            block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
            block = setParamExpr(block, 'Operator', 'reciprocal');
        case 'conj'
            block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
            block = setParamExpr(block, 'Operator', 'conj');
        case '|u|^2'
            block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
            block = setParamExpr(block, 'Operator', 'magnitude^2');
        case 'log2'
            % There is no log2 available, so we calculate using log(x)/log(2)
            block = addBlockExpr(block, 'simulink/User-Defined Functions/MATLAB Function');
            block = setMatlabFunctionScriptExpr(block, sprintf([...
                'function y = f(x)\n'...
                '%#codegen\n'...
                'y = log(x)/log(2);'...
                'end\n'...
            ]));
        case 'erf'
            % There is no erf in Simulink and we have to resort to Matlab.
            block = addBlockExpr(block, 'simulink/User-Defined Functions/MATLAB Function');
            block = setMatlabFunctionScriptExpr(block, sprintf([...
                'function y = f(x)\n'...
                '%#codegen\n'...
                'y = erf(x);\n'...
                'end\n'...
            ]));
        case 'erfc'
            % There is no erfc in Simulink and we have to resort to Matlab.
            block = addBlockExpr(block, 'simulink/User-Defined Functions/MATLAB Function');
            block = setMatlabFunctionScriptExpr(block, sprintf([...
                'function y = f(x)\n'...
                '%#codegen\n'...
                'y = erfc(x);\n'...
                'end\n'...
            ]));
        case '2^u'
            block = addBlockExpr(block, 'simulink/User-Defined Functions/MATLAB Function');
            block = setMatlabFunctionScriptExpr(block, sprintf([...
                'function y = f(x)\n'...
                '%#codegen\n'...
                'y = 2.^x;\n'...
                'end\n'...
            ]));
        case 'round'
            block = addBlockExpr(block, 'simulink/Math Operations/Rounding Function');
            block = setParamExpr(block, 'Operator', 'round');
        case 'floor'
            block = addBlockExpr(block, 'simulink/Math Operations/Rounding Function');
            block = setParamExpr(block, 'Operator', 'floor');
        case 'ceil'
            block = addBlockExpr(block, 'simulink/Math Operations/Rounding Function');
            block = setParamExpr(block, 'Operator', 'ceil');
        case 'int'
            block = addBlockExpr(block, 'simulink/Math Operations/Rounding Function');
            block = setParamExpr(block, 'Operator', 'fix');
        otherwise
            block = addBlockExpr(block, 'simulink/Math Operations/Math Function');
            block = setParamExpr(block, 'Operator', 'exp');
    end

    block = addCommonProperties(block);
    out = updateSystem(system, block);
end
