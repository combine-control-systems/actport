function import_activate_oml(filename, target_path)
    %IMPORTACTIVATEOML Import OML-code exported from Activate to Simulink
    %   Detailed explanation goes here
    import actport.GeneratorLibrary.scanLibrary;
    import actport.Logger;

    global ACTPORT_LIBRARY;

    clc;

    if nargin == 1
        % Default path.
        target_path = pwd;
    end

    setenv('ACTPORT_TARGET_PATH', target_path);

    % We do not know the name of the model at this stage.
    % However, when exporting OML models, the filename and
    % the model name remain consistent.
    [~, basename] = fileparts(filename);
    if length(basename) > 42
        error("Filename length is greater than 42 characters, this script will not run");
    end
    log_path = fullfile(target_path, sprintf('actport_%s.log', basename));
    Logger.initialize(log_path);
    logger(sprintf('Initialized logger at %s.', log_path));

    ACTPORT_LIBRARY = scanLibrary('activate_standard_library');

    addpath(pwd);
    addpath(fullfile(pwd, 'activate_standard_library'));

    % We need to wrap the code in a function in order to make Matlab
    % want to read the source code at all.
    fid = fopen(filename);
    src = fread(fid, '*char')';
    fclose(fid);

    % We must import the API from the JAR-file in every function.
    src = regexprep(src, 'function[^\n]+', '$0\nimport actport.oml.Matlab.*');

    % Rename all add_block calls to avoid shadowing add_block from the Simulink API.
    src = regexprep(src, 'add_block', 'add_block_2');

    % Matlab must have script code at the beginning of the file in order to be able to
    % embed functions as well.
    src = regexprep(src, '(.*end\r?\n)(.*)', '$2\n$1');

    % Add import of API.
    src = sprintf('import actport.oml.Matlab.*\n%s', src);

    filename = sprintf('oml_import_%s_%10.0f.m', basename, posixtime(datetime));

    fullpath = fullfile(tempdir, filename);

    fid = fopen(fullpath, 'w');
    fwrite(fid, src);
    fclose(fid);

    run(fullfile(tempdir, filename));

    % We are expected to clean up temporary files ourselves.
    % https://superuser.com/a/296827
    delete(fullpath);
end
