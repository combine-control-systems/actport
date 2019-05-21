% activate = 'system/SignalGenerators/ContinuousRandom'
function model = actport_continuous_random(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    distribution = 'uniform';

    if strcmp(get_parameter(model, block_id, 'distrib/uniform', '0'), '1')
        distribution = 'uniform';
    elseif strcmp(get_parameter(model, block_id, 'distrib/normal', '0'), '1')
        distribution = 'normal';
    elseif strcmp(get_parameter(model, block_id, 'distrib/log_normal', '0'), '1')
        distribution = 'log_normal';
    elseif strcmp(get_parameter(model, block_id, 'distrib/beta', '0'), '1')
        distribution = 'beta';
    elseif strcmp(get_parameter(model, block_id, 'distrib/gamma', '0'), '1')
        distribution = 'gamma';
    elseif strcmp(get_parameter(model, block_id, 'distrib/chi', '0'), '1')
        distribution = 'chi';
    elseif strcmp(get_parameter(model, block_id, 'distrib/exp', '0'), '1')
        distribution = 'exp';
    elseif strcmp(get_parameter(model, block_id, 'distrib/F', '0'), '1')
        distribution = 'F';
    elseif strcmp(get_parameter(model, block_id, 'distrib/T', '0'), '1')
        distribution = 'T';
    elseif strcmp(get_parameter(model, block_id, 'distrib/pearson', '0'), '1')
        distribution = 'pearson';
    elseif strcmp(get_parameter(model, block_id, 'distrib/inv_gamma', '0'), '1')
        distribution = 'inv_gamma';
    elseif strcmp(get_parameter(model, block_id, 'distrib/inv_beta', '0'), '1')
        distribution = 'inv_beta';
    else
        warning(sprintf('unknown distribution %s - falling back onto uniform', distribution));
    end

    seed = char(get_parameter(model, block_id, 'seed', '0'));

    switch distribution
        case 'uniform'
            add_uniform_random_number(model, block_id, block_path, seed);
            A = char(get_parameter(model, block_id, 'Uniform_param/A', '0'));
            B = char(get_parameter(model, block_id, 'Uniform_param/B', '1'));
            set_param(block_path, 'Minimum', A);
            set_param(block_path, 'Maximum', B);
        case 'normal'
            add_block('simulink/Sources/Random Number', block_path);
            m = char(get_parameter(model, block_id, 'Normal_param/mean', '0'));
            v = char(get_parameter(model, block_id, 'Normal_param/variance', '1'));
            set_param(block_path, 'Mean', m);
            set_param(block_path, 'Variance', v);
            set_param(block_path, 'Seed', seed);
        case 'log_normal'
            ml = char(get_parameter(model, block_id, 'LNormal_param/meanL', '0'));
            vl = char(get_parameter(model, block_id, 'LNormal_param/varianceL', '1'));
            % Quantile function of log-normal distribution.
            qfunc = sprintf([...
                'function x = f(y)\n'...
                '%%#codegen\n'...
                'x = exp(%s + sqrt(2*%s^2) * erfinv(2*y-1));\n'...
                'end\n'...
            ], ml, vl);
            add_quantile_function(model, block_id, block_path, seed, qfunc);
        case 'beta'
            alpha = char(get_parameter(model, block_id, 'Beta_param/alpha', '1'));
            beta = char(get_parameter(model, block_id, 'Beta_param/beta', '1'));
            % Quantile function for beta distribution.
            qfunc = sprintf([...
                'function x = f(y)\n'...
                '%%#codegen\n'...
                'x = betaincinv(y, %s, %s);\n'...
                'end\n'...
            ], alpha, beta);
            add_quantile_function(model, block_id, block_path, seed, qfunc);
        case 'gamma'
            k = char(get_parameter(model, block_id, 'Gamma_param/k', '1'));
            theta = char(get_parameter(model, block_id, 'Gamma_param/theta', '1'));
            % Quantile function for gamma distribution.
            qfunc = sprintf([...
                'function x = f(y)\n'...
                '%%#codegen\n'...
                'x = (%s) * gammaincinv(y, %s);\n'...
                'end\n'...
            ], theta, k);
            add_quantile_function(model, block_id, block_path, seed, qfunc);
        %case 'chi'
        %    K = char(get_parameter(model, block_id, 'Chi_param/K', '1'));
        %    qfunc = ???;
        %    add_quantile_function(model, block_id, block_path, seed, qfunc);
        case 'exp'
            lambda = char(get_parameter(model, block_id, 'Exp_param/lambda', '1'));
            % Quantile function for exponential distribution.
            qfunc = sprintf([...
                'function x = f(y)\n'...
                '%%#codegen\n'...
                'x = -log(1-y)/(%s);\n'...
                'end\n'...
            ], lambda);
            add_quantile_function(model, block_id, block_path, seed, qfunc);
        %case 'F'
        %    d1 = char(get_parameter(model, block_id, 'F_param/d1', '1'));
        %    d2 = char(get_parameter(model, block_id, 'F_param/d2', '1'));
        %    qfunc = ???;
        %    add_quantile_function(model, block_id, block_path, seed, qfunc);
        %case 'T'
        %    t = char(get_parameter(model, block_id, 'T_param/t', '1'));
        %    qfunc = ???;
        %    add_quantile_function(model, block_id, block_path, seed, qfunc);
        %case 'pearson'
        %    m = char(get_parameter(model, block_id, 'Pearson_param/mean', '1'));
        %    v = char(get_parameter(model, block_id, 'Pearson_param/variance', '1'));
        %    skewness = char(get_parameter(model, block_id, 'Pearson_param/skewness', '1'));
        %    kurtosis = char(get_parameter(model, block_id, 'Pearson_param/skewness', '3'));
        %    qfunc = ???;
        %    add_quantile_function(model, block_id, block_path, seed, qfunc);
        case 'inv_gamma'
            alpha = char(get_parameter(model, block_id, 'Inv_gamma_param/alpha', '1'));
            beta = char(get_parameter(model, block_id, 'Inv_gamma_param/beta', '1'));
            % Quantile function for inverse gamma distribution.
            qfunc = sprintf([...
                'function x = f(y)\n'...
                '%%#codegen\n'...
                'x = (%s) / gammaincinv(y, %s);\n'...
                'end\n'...
            ], beta, alpha);
            add_quantile_function(model, block_id, block_path, seed, qfunc);
        %case 'inv_beta'
        %    alpha = char(get_parameter(model, block_id, 'Inv_beta_param/alpha', '1'));
        %    beta = char(get_parameter(model, block_id, 'Inv_beta_param/beta', '1'));
        %    % Quantile function for inverse beta distribution.
        %    qfunc = ???;
        %    add_quantile_function(model, block_id, block_path, seed, qfunc);
        otherwise
            warning(sprintf('random number generator for %s distribution not implemented', distribution));
            model = actport_undefined(model, block_id, model_path);
    end

    set_common_parameters(model, block_id, model_path);
end

function add_quantile_function(model, block_id, block_path, seed, qfunc)
    add_clean_subsystem(block_path);
    uniform_path = sprintf('%s/%s', block_path, 'uniform');
    add_uniform_random_number(model, block_id, uniform_path, seed);
    out_path = sprintf('%s/%s', block_path, 'out');
    add_block('simulink/Ports & Subsystems/Out1', out_path);
    q_path = sprintf('%s/%s', block_path, 'quantile');
    add_block('simulink/User-Defined Functions/MATLAB Function', q_path);
    sf = sfroot;
    q_block = sf.find('Path', q_path, '-isa', 'Stateflow.EMChart');
    q_block.Script = qfunc;
    add_line(block_path, 'uniform/1', 'quantile/1');
    add_line(block_path, 'quantile/1', 'out/1');
    Simulink.BlockDiagram.arrangeSystem(char(block_path));
end

function add_uniform_random_number(model, block_id, block_path, seed)
    import actport.model.Matlab.*
    add_block('simulink/Sources/Uniform Random Number', block_path);
    set_param(block_path, 'Minimum', '0');
    set_param(block_path, 'Maximum', '1');
    set_param(block_path, 'Seed', seed);
    set_param(block_path, 'SampleTime', char(get_sample_rate(model, block_id)));
end
