# ActPort

Convert Altair Activate models to Matlab/Simulink.

## Overview

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
