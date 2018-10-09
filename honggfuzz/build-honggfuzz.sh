#!/bin/bash -xe

# Download the latest honggfuzz
echo "Downloading honggfuzz..."
curl -o $ASSETS_DIR/honggfuzz.tar.gz https://codeload.github.com/google/honggfuzz/tar.gz/1.6

# Unpack the source tar file
echo "Unpacking..."
tar xvfz $ASSETS_DIR/honggfuzz.tar.gz -C $ASSETS_DIR/

# Remove the original sources
echo "Removing original sources..."
rm $ASSETS_DIR/honggfuzz.tar.gz

# Move the honggfuzz-(version number) directory to a standard honggfuzz-latest directory
echo "Moving the latest AFL to a standardised name..."
mv $ASSETS_DIR/honggfuzz-* $ASSETS_DIR/honggfuzz-latest/

# Change to the honggfuzz source directory
echo "Changing into the honggfuzz source directory..."
cd $ASSETS_DIR/honggfuzz-latest/

# Make the binaries
echo "Making the binaries..."
make

# Installing them to the PATH
echo "Installing the binaries to the path..."
cp honggfuzz /usr/local/bin/
cp hfuzz_cc/hfuzz-cc /usr/local/bin/
cp hfuzz_cc/hfuzz-clang /usr/local/bin/
cp hfuzz_cc/hfuzz-clang++ /usr/local/bin/
cp hfuzz_cc/hfuzz-g++ /usr/local/bin/
cp hfuzz_cc/hfuzz-gcc /usr/local/bin/

# Clean up the unnecessary files
make clean
