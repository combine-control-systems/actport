#!/bin/bash

p="target/scala-2.12/actport-assembly-0.1-SNAPSHOT.jar"

set -o pipefail
log=src/test/actport_$(basename "$MODEL" | cut -d. -f1).log
$MATLAB -nodesktop -nosplash -batch "javaaddpath('$p'), cd src/main/matlab, import_activate_oml('$MODEL', '$WORKSPACE/src/test');" 2> >(tee --append "$log" >&2)
