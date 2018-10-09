#!/bin/bash -xe

if [[ -z "${ASSETS_BASEDIR}" ]]; then
    echo "ASSETS_BASEDIR is not set!"
    exit 1
fi

# Create the ASSETS_DIR
export ASSETS_DIR="$ASSETS_BASEDIR/afl-fast"
mkdir -p $ASSETS_DIR
