#!/bin/bash -xe

if [[ -z "${ASSETS_BASEDIR}" ]]; then
    echo "ASSETS_BASEDIR is not set!"
    exit 1
fi

# Create the ASSETS_DIR
export ASSETS_DIR="$ASSETS_BASEDIR/honggfuzz"
mkdir -p $ASSETS_DIR
