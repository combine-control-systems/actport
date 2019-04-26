function import_activate_oml(filename)
    %IMPORTACTIVATEOML Import OML-code exported from Activate to Simulink
    %   Detailed explanation goes here
    import actport.GeneratorLibrary.scanLibrary

    global ACTPORT_LIBRARY;

    ACTPORT_LIBRARY = scanLibrary('activate_standard_library');

    addpath(pwd);
    addpath(fullfile(pwd, 'activate_standard_library'));

    % We need to wrap the code in a function in order to make Matlab
    % want to read the source code at all.
    fid = fopen(filename);
    src = fread(fid, '*char')';
    fclose(fid);

    % We must import the API from the JAR-file in every function.
    src = regexprep(src, 'function[^\n]+', '$0\nimport actport.ActivateApi.*');

    % Rename all add_block calls to avoid shadowing add_block from the Simulink API.
    src = regexprep(src, 'add_block', 'add_block_2');

    % Matlab must have script code at the beginning of the file in order to be able to
    % embed functions as well.
    src = regexprep(src, '(.*end)(.*)', '$2\neval(scsm);\n$1');

    % Add import of API.
    src = sprintf('import actport.ActivateApi.*\n%s', src);

    [~, filename] = fileparts(filename);
    filename = sprintf('oml_import_%s_%10.0f.m', filename, posixtime(datetime));

    fullpath = fullfile(tempdir, filename);

    fid = fopen(fullpath, 'w');
    fwrite(fid, src);
    fclose(fid);

    run(fullfile(tempdir, filename));

    % We are expected to clean up temporary files ourselves.
    % https://superuser.com/a/296827
    delete(fullpath);
end
