# ActPort

Convert Altair Activate models to Matlab/Simulink.

## Overview for Users

First [download a release](https://github.com/combine-control-systems-ab/actport/releases)
and unzip the file.
Start Matlab and change the current directory to the `actport` directory
of the newly unzipped archive. Initialize ActPort:

```Matlab
init_actport
```

In Activate you can export your model to an OML-file using:

```Matlab
bdeExportModelToOml(bdeGetCurrentModel, 'D:/mymodel.oml');
```

Then import it into Simulink using the following command in Matlab:

```Matlab
import_activate_oml('D:/mymodel.oml');
```

There are some [limitations](docs/limitations.md) 
of what ActPort can convert right now.

In the docs folder of the zip-archive there is a file
called `blocks-info.md` in which all the in-source
comments have been extracted from the blocks showing
documented limitations for each block.

## Overview for Developers

The tool is written in Matlab and Scala. Matlab
is acting as master and the code in Scala is
mainly holding an intermediate data model of the
Activate model.

To export a model from Activate you first need to
convert it to an OML-file:

```Matlab
bdeExportModelToOml(bdeGetCurrentModel, 'D:/mymodel.oml');
``` 

In Matlab the JAR-file generated from the Scala code must 
be present in the Matlab class path (see `javaaddpath`).

To import the OML-file run:

```Matlab
import_activate_oml('D:/mymodel.oml');
```

A Simulink window should be opened and filled with
supported blocks and links.

Learn more about the [conversion process](docs/conversion-process.md).
There are currently some [limitations](docs/limitations.md).
[Pull requests](docs/contributing.md) are welcome.

## Supported versions

* Matlab versions from 2019a have been tested (earlier version may work).
* Activate versions from 2019.2 are supported.

## Build and test

First [build and install](docs/build-and-install.md) the software.
Then `cd` to `src/main/matlab` and run

```Matlab
import_activate_oml('../../test/resources/examples/Watertank.oml');
```

to convert the Watertank model.
