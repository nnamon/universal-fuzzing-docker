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

# Build honggfuzz and install it
apt-get -y install curl build-essential binutils-dev libunwind-dev
cp ./build-honggfuzz.sh $ASSETS_DIR/
chmod +x $ASSETS_DIR/build-honggfuzz.sh
$ASSETS_DIR/build-honggfuzz.sh

popd
