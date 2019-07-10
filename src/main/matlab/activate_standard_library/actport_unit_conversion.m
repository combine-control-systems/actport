% activate = 'system/SignalConversions/UnitConversion'
function model = actport_unit_conversion(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    mode = 'Unknown';
    if strcmp(char(get_parameter(model, block_id, 'ucategory/Temperature', '0')), '1')
        mode = 'Temperature';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Volume', '0')), '1')
        mode = 'Volume';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Pressure', '0')), '1')
        mode = 'Pressure';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Distance', '0')), '1')
        mode = 'Distance';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Speed', '0')), '1')
        mode = 'Speed';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Acceleration', '0')), '1')
        mode = 'Acceleration';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Force', '0')), '1')
        mode = 'Force';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Energy', '0')), '1')
        mode = 'Energy';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Power', '0')), '1')
        mode = 'Power';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Mass', '0')), '1')
        mode = 'Mass';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Flow', '0')), '1')
        mode = 'Flow';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Area', '0')), '1')
        mode = 'Area';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Charge', '0')), '1')
        mode = 'Charge';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Volt', '0')), '1')
        mode = 'Volt';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Current', '0')), '1')
        mode = 'Current';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Resistance', '0')), '1')
        mode = 'Resistance';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Capacitance', '0')), '1')
        mode = 'Capacitance';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Magnetic_Flux', '0')), '1')
        mode = 'Magnetic_Flux';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Inductance', '0')), '1')
        mode = 'Inductance';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Torque', '0')), '1')
        mode = 'Torque';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Rotary_Inertia', '0')), '1')
        mode = 'Rotary_Inertia';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Rotation', '0')), '1')
        mode = 'Rotation';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Rotational_Speed', '0')), '1')
        mode = 'Rotational_Speed';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Density', '0')), '1')
        mode = 'Density';
    elseif strcmp(char(get_parameter(model, block_id, 'ucategory/Enthalpy', '0')), '1')
        mode = 'Enthalpy';
    else
        error('Invalid conversion category.');
    end

    input_unit = char(get_parameter(model, block_id, sprintf('PI_%s', mode), ''));
    output_unit = char(get_parameter(model, block_id, sprintf('PO_%s', mode), ''));

    input_unit = strrep(input_unit, '''', '');
    output_unit = strrep(output_unit, '''', '');

    if isempty(input_unit)
        error('Failed to read input unit.');
    end

    if isempty(output_unit)
        error('Failed to read output unit.');
    end

    add_clean_subsystem(block_path);

    input_unit_compat = [strrep(input_unit, '/', ' per ') ' in'];
    output_unit_compat = [strrep(output_unit, '/', ' per ') ' out'];

    [converted_input_unit, input_gain_value] = convert_unit(input_unit);
    [converted_output_unit, output_gain_value] = convert_unit(output_unit);

    input_path = sprintf('%s/%s', block_path, input_unit_compat);
    add_block('simulink/Sources/In1', input_path);

    output_path = sprintf('%s/%s', block_path, output_unit_compat);
    add_block('simulink/Sinks/Out1', output_path);

    input_gain = sprintf('%s/Input Gain', block_path);
    add_block('simulink/Math Operations/Gain', input_gain);
    set_param(input_gain, 'Gain', num2str(input_gain_value));

    output_gain = sprintf('%s/Output Gain', block_path);
    add_block('simulink/Math Operations/Gain', output_gain);
    set_param(output_gain, 'Gain', num2str(1/output_gain_value));

    add_block('simulink/Signal Attributes/Signal Specification', sprintf('%s/Input Unit', block_path));
    set_param(sprintf('%s/Input Unit', block_path), 'Unit', converted_input_unit);

    add_block('simulink/Signal Attributes/Signal Specification', sprintf('%s/Output Unit', block_path));
    set_param(sprintf('%s/Output Unit', block_path), 'Unit', converted_output_unit);

    add_block('simulink/Signal Attributes/Unit Conversion', sprintf('%s/Unit Conversion', block_path));

    add_line(block_path, sprintf('%s/1', input_unit_compat), 'Input Gain/1');
    add_line(block_path, 'Input Gain/1', 'Input Unit/1');
    add_line(block_path, 'Input Unit/1', 'Unit Conversion/1');
    add_line(block_path, 'Unit Conversion/1', 'Output Unit/1');
    add_line(block_path, 'Output Unit/1', 'Output Gain/1');
    add_line(block_path, 'Output Gain/1', sprintf('%s/1', output_unit_compat));

    Simulink.BlockDiagram.arrangeSystem(block_path);

    set_common_parameters(model, block_id, model_path);
end

function [unit, scale] = convert_unit(old_unit)
    % Based on Matlab command 'showunitslist'.
    % Only convert when necessary.
    unit = old_unit;
    scale = 1;
    c = 299792458; % Speed of light in m/s.
    switch unit
        % Temperature.
        case 'celsius'
            unit = 'degC';
        case 'fahrenheit'
            unit = 'degF';
        case 'kelvin'
            unit = 'K';
        case 'rankine'
            unit = 'degR';
        % Volume.
        case 'barrel'
            unit = 'gal';
            scale = 42;
        case 'bushel (U.S.)'
            unit = 'in^3';
            scale = 2150.42;
        case 'cord'
            unit = 'ft^3';
            scale = 128;
        case 'gallon'
            unit = 'gal';
        case 'ounce (U.S. fluid)'
            unit = 'in^3';
            scale = 1.8046875;
        case 'pint (U.S. dry)'
            unit = 'in^3';
            scale = 33.6003125;
        case 'pint (U.S. liquid)'
            unit = 'in^3';
            scale = 28.875;
        case 'quart (U.S. dry)'
            unit = 'in^3';
            scale = 67.2;
        case 'quart (U.S. liquid)'
            unit = 'in^3';
            scale = 57.75;
        case 'cup'
            unit = 'cm^3';
            scale = 236.5882365;
        case 'tablespoon'
            % TODO: The conversion of tablespoon does not make sense, but gives the
            %       same result as Activate.
            unit = 'cm^3';
            scale = 2.13845;
        case 'teaspoon'
            % TODO: The conversion of teaspoon does not make sense, but gives the
            %       same result as Activate.
            unit = 'cm^3';
            scale = 4.92892;
        % Pressure
        case 'N/m^2 (Pascal)'
            unit = 'Pa';
        case 'barye'
            unit = 'Pa';
            scale = 0.1;
        case 'in Hg'
            % @60degF
            unit = 'Pa';
            scale = 3376.85;
        case 'in H20 @4C'
            unit = 'Pa';
            scale = 249.089;
        case 'lb/in^2 (psi)'
            unit = 'psi';
        case 'millibar'
            unit = 'mbar';
        case 'torr @0C'
            unit = 'Pa';
            scale = 101325/760;
        case 'cm H20 @4C'
            unit = 'Pa';
            scale = 98.0665;
        case 'mm Hg @0C'
            unit = 'Pa';
            scale = 133.322387415;
        case 'in Hg @0C'
            unit = 'inHg';
        % Distance
        case 'angstrom'
            unit = 'ang';
        case 'astronomical unit'
            unit = 'au';
        case 'cable'
            unit = 'M';
            scale = 0.1;
        case 'caliber'
            unit = 'in';
            scale = 0.01;
        case 'fathom'
            unit = 'm';
            scale = 1.828804;
        case 'furlong'
            unit = 'yd';
            scale = 220;
        case 'light year'
            unit = 'ly';
        case 'micron'
            unit = 'micron';
        case 'mile'
            unit = 'mi';
        case 'nautical mile (international)'
            unit = 'M';
        case 'nautical mile (U.S.)'
            unit = 'M';
        case 'nautical mile (U.K.)'
            unit = 'km';
            scale = 1/0.53961;
        % Speed
        % Acceleration
        case 'galileo'
            unit = 'cm/s^2';
        % Force
        case 'poundals'
            unit = 'pdl';
        % Energy
        case 'Joule'
            unit = 'J';
        case 'BTU'
            unit = 'Btu_th';
        case 'cal'
            unit = 'cal_th';
        case 'electron volt'
            unit = 'eV';
        case 'ft.lbf'
            unit = 'ft*lbf';
        case 'hp.hr'
            unit = 'J';
            scale = 2684519.5377;
        case 'kW.hr'
            unit = 'kW*hr';
        case 'W.hr'
            unit = 'W*hr';
        case 'W.s'
            unit = 'W*s';
        % Power
        case 'Watt'
            unit = 'W';
        case 'BTU/s'
            unit = 'Btu_th/s';
        case 'ft.lbf/s'
            unit = 'ft*lbf/s';
        case 'horsepower'
            unit = 'HP_mech';
        case 'kWatt'
            unit = 'kW';
        case 'lumens'
            unit = 'W';
            scale = 0.001496;
        case 'BTU/hr'
            unit = 'Btu_th/hr';
        case 'Joule/sec'
            unit = 'W';
        % Mass
        case 'lb'
            unit = 'lbm';
        case 'carat'
            unit = 'mg';
            scale = 200;
        case 'metric ton'
            unit = 'kg';
            scale = 1000;
        case 'ounce'
            unit = 'oz';
        case 'long ton (2240 lbs)'
            unit = 'lbm';
            scale = 2240;
        case 'short ton (2000 lbs)'
            unit = 'lbm';
            scale = 2000;
        case 'tonne'
            unit = 'kg';
            scale = 1000;
        % Flow
        case 'm^3/s'
            unit = 'm^3/s';
        case 'ft^3/s'
            unit = 'ft^3/s';
        case 'gal/day'
            unit = 'gal/d';
        case 'gal/min'
            unit = 'gal/min';
        case 'm^3/day'
            unit = 'm^3/d';
        case 'million gal/day'
            unit = 'gal/d';
            scale = 1e6;
        case 'ft^3/m'
            unit = 'ft^3/min';
        % Area
        case 'acre'
            unit = 'ac';
        case 'are'
            unit = 'm^2';
            scale = 100;
        case 'barn'
            unit = 'm^2';
            scale = 1e-28;
        case 'hectare'
            unit = 'm^2';
            scale = 1e4;
        % Charge
        case 'abcoulomb'
            unit = 'C';
            scale = 10;
        case 'faraday'
            unit = 'C';
            scale = 1.602176634e-19 * 6.02214076e23; % elementary charge * Avogadro constant = charge / mol
        case 'micro-coulomb'
            unit = 'microcoulomb';
        case 'milli-coulomb'
            unit = 'mC';
        case 'statcoulomb'
            unit = 'C';
            scale = 2997924580;
        % Volt
        case 'abvolt'
            unit = 'V';
            scale = 1e-8;
        case 'micro-volt'
            unit = 'microvolt';
        case 'milli-volt'
            unit = 'mV';
        case 'statvolt'
            unit = 'V';
            scale = 299.792458;
        % Current
        case 'abampere'
            unit = 'A';
            scale = 10;
        case 'micro-ampere'
            unit = 'microampere';
        case 'milli-ampere'
            unit = 'mA';
        case 'statampere'
            unit = 'A';
            scale = 299.7924580;
        % Resistance
        case 'abohm'
            unit = 'Ohm';
            scale = 1e-9;
        case 'micro-ohm'
            unit = 'microohm';
        case 'milli-ohm'
            unit = 'mOhm';
        case 'statohm'
            unit = 'Ohm';
            scale = 8.987551787e11;
        % Capacitance
        case 'abfarad'
            unit = 'F';
            scale = 1e9;
        case 'micro-farad'
            unit = 'microfarad';
        case 'milli-farad'
            unit = 'mF';
        case 'statfarad'
            unit = 'F';
            scale = 1/(1e-5*c^2);
        % Magnetic flux
        case 'maxwell'
            unit = 'Wb';
            scale = 1e-8;
        case 'micro-weber'
            unit = 'microweber';
        case 'milli-weber'
            unit = 'mWb';
        % Inductance.
        case 'abhenry'
            unit = 'H';
            scale= 1e-9;
        case 'micro-henry'
            unit = 'microhenry';
        case 'milli-henry'
            unit= 'mH';
        case 'stathenry'
            unit = 'H';
            scale = 8.987552e11;
        % Torque
        case 'N.m'
            unit = 'N*m';
        case 'kg.m'
            unit = 'N*m';
            scale = 9.806;
        case 'dyne.cm'
            unit = 'dyn*cm';
        case 'gm.cm'
            unit = 'N*m';
            scale = 9.806e-5;
        case 'kg.cm'
            unit = 'N*m';
            scale = 0.09806;
        case 'lb.ft'
            unit = 'lb*ft';
        case 'lb.in'
            unit = 'lb*in';
        case 'oz.in'
            unit = 'N*m';
            scale = 0.00706484;
        % Rotary intertia
        case 'kg.cm.s^2'
            unit = 'kg*cm*s^2';
        case 'gm.cm^2'
            unit = 'kg*cm*s^2';
            scale = 1.01972e-6;
        case 'gm.cm.s^2'
            unit = 'kg*cm*s^2';
        case 'kg.cm^2'
            unit = 'kg*cm*s^2';
            scale = 0.00101972;
        case 'lb.ft^2'
            unit = 'kg*cm*s^2';
            scale = 0.429738;
        case 'lb.ft.s^2'
            unit = 'kg*cm*s^2';
            scale = 13.8313;
        case 'lb.in^2'
            unit = 'kg*cm*s^2';
            scale = 0.00298418;
        case 'lb.in.s^2'
            unit = 'kg*cm*s^2';
            scale = 1.15221;
        case 'oz.in^2'
            unit = 'kg*cm*s^2';
            scale = 0.000186567;
        case 'oz.in.s^2'
            unit = 'kg*cm*s^2';
            scale = 0.0720098;
        case 'slug.ft^2'
            unit = 'kg*cm*s^2';
            scale = 13.8313;
        % Rotation
        case 'radians'
            unit = 'rad';
        case 'degrees'
            unit = 'deg';
        % Rotational speed
        case 'rad/sec'
            unit = 'rad/s';
        case 'degrees/sec'
            unit = 'deg/s';
        case 'RPM'
            unit = 'rpm';
        % Density
        case 'lb/f^3'
            unit = 'lbm/ft^3';
        case 'pound/gallon'
            unit = 'lbm/gal';
        case 'ton/cubic yard'
            unit = 'kg/m^3';
            scale = 1186.55;
        % Enthalpy
        case 'BTU/lb'
            unit = 'Btu_th/lbm';
    end
end
