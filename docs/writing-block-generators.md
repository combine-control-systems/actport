# Writing block generators

A block generator is a Matlab function which is called to generate a Simulink block. 
Here is one example:
```matlab
% activate = 'system/MatrixOperations/MatrixInverse'
function model = actport_matrix_inverse(model, block_id, model_path)
    import actport.model.Matlab.*

    name = get_name(model, block_id);
    block_path = sprintf('%s/%s', model_path, name);

    add_block('simulink/Math Operations/Divide', block_path);
    set_param(block_path, 'Inputs', '/');
    set_param(block_path, 'Multiplication', 'Matrix(*)');

    set_common_parameters(model, block_id, model_path);
end
```

The file starts with
```matlab
% activate = 'system/MatrixOperations/MatrixInverse'
```
on the first line of the file. The string is used to match the Activate block which the function handles.
After that we have access to the Matlab interface to our data model by importing:
```matlab
    import actport.model.Matlab.*
```

All functions available in the Matlab interface are available [here](../src/main/scala/actport/model/Matlab.scala).
Otherwise all functions in the [Simulink API](https://se.mathworks.com/help/simulink/ug/approach-modeling-programmatically.html)
are available as usual.

Most block generating functions finish by calling `set_common_parameters` which applies position, size, color, and 
so on.

[See other supported blocks](../src/main/matlab/activate_standard_library) for more details.
