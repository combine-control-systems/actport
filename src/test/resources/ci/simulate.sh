#!/bin/bash

set -o pipefail
log=$(dirname "$MODEL")/actport.log
$MATLAB -nodesktop -nosplash -batch "sim('$MODEL');" |& tee --append "$log"
