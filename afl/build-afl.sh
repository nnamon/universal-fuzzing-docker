#!/bin/bash -xe

# $ASSETS_DIR comes from the Dockerfile

# Download the latest AFL
echo "Downloading AFL..."
curl -o $ASSETS_DIR/afl-latest.tgz http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz

# Unpack the source tar file
echo "Unpacking..."
tar xvfz $ASSETS_DIR/afl-latest.tgz -C $ASSETS_DIR/

# Remove the original sources
echo "Removing original sources..."
rm $ASSETS_DIR/afl-latest.tgz

# Move the afl-(version number) directory to a standard afl-latest directory
echo "Moving the latest AFL to a standardised name..."
mv $ASSETS_DIR/afl-* $ASSETS_DIR/afl-latest/

# Change to the AFL source directory
echo "Changing into the AFL source directory..."
cd $ASSETS_DIR/afl-latest/

# Make the basic and LLVM AFL binaries
echo "Making the AFL binaries..."
make && make -C llvm_mode CXX=g++

# Install the AFL binaries on the system
echo "Installing..."
make install

# Build the AFL LLVM Runtime
clang -o $ASSETS_DIR/afl-llvm-rt.o -c \
    -w $ASSETS_DIR/afl-latest/llvm_mode/afl-llvm-rt.o.c

# Remove all unnecessary build files
make clean
