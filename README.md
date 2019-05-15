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

## Supported versions

* Matlab versions from 2019a are supported.
* Activate versions from 2019.2 are supported.

## Build and test

To build the software 
[JDK 8](https://adoptopenjdk.net/)
and [sbt](https://www.scala-sbt.org/) is needed. 
Start a terminal and run `sbt assembly` in the
folder where `build.sbt` is located.
The resulting jar-file should end up in `target/scala-2.12`.
Add that file to the Matlab path using `javaaddpath`.
In Matlab, set the working directory to `src/main/matlab` and
run `import_activate_oml('../resources/examples/Watertank.oml');'`.
