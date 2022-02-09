#!/bin/bash
YARN_BIN=/usr/local/bin/yarn.wrp
if [[ -d ./node_modules ]]; then
    echo "Modules at ./node_modules"
    exec $YARN_BIN $@
elif [[ -L ./node_modules_cache ]]; then
    echo "Modules chached at ./node_modules_cache -> $(readlink ./node_modules_cache)"
    export NODE_PATH=$(readlink ./node_modules_cache)
    export PATH="$(readlink ./node_modules_cache)/.bin:${PATH}"
    exec $YARN_BIN --modules-folder /node_modules_cache $@
else
    echo "No node_modules found :("
    exit 2
fi