#!/bin/bash -xe

# $ASSETS_DIR comes from the Dockerfile

# Download the latest AFL-fast
echo "Cloning AFL fast..."
git clone --depth 1 https://github.com/mboehme/aflfast.git $ASSETS_DIR/aflfast

# Change to the AFL-fast source directory
echo "Changing into the AFL fast source directory..."
cd $ASSETS_DIR/aflfast/

# Make the basic and LLVM AFL binaries
echo "Making the AFL binaries..."
make && make -C llvm_mode CXX=g++

# Install the AFL-fast binaries on the system
echo "Installing..."
# Only install afl-fuzz because it is the only thing that changed.
cp afl-fuzz /usr/local/bin/afl-fast-fuzz

# Remove all unnecessary build files
make clean
