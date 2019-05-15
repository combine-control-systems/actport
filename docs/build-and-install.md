# Build and Install

To build the software 
[JDK 8](https://adoptopenjdk.net/)
and [sbt](https://www.scala-sbt.org/) is needed. 
- Start a terminal and run `sbt assembly` in the
folder where `build.sbt` is located.
- The resulting jar-file should end up in `target/scala-2.12`.
- Add that file to the Matlab path using `javaaddpath`.

If the software needs to be rebuilt Matlab needs to forget about
the old classes by doing something like:

```Matlab
clear all;
close all;
clear classes;
rehash;

javarmpath(<path to jar-file>);
javaaddpath(<path to jar-file>);
```
