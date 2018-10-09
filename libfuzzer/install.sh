#!/bin/bash -xe

# Get the script's directory and cd into it to make all filenames relative.
# Source: https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
pushd $DIR
source exported_variables.sh

# Skip. Nothing needs to be done.

popd
