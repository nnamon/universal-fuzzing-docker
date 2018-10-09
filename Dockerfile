# The image from which all other images derive from.

FROM ubuntu:16.04

# Update and install essentials.
RUN apt-get update && apt-get -y upgrade && apt-get -y install sudo vim && apt-get clean

# Install clang
RUN apt-get -y install wget software-properties-common
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial main"
RUN apt-get update
RUN apt-get -y install clang
ADD ./llvm-update-alternatives.sh .
RUN sh llvm-update-alternatives.sh
RUN rm llvm-update-alternatives.sh
RUN apt-get clean

# Setup a place for all the fuzzers to live in.
ENV ASSETS_BASEDIR "/fuzzers"
RUN mkdir $ASSETS_BASEDIR

# Install afl
ADD ./afl build-afl
RUN ./build-afl/install.sh
RUN rm -rf build-afl

# Install afl-fast
ADD ./afl-fast build-afl-fast
RUN ./build-afl-fast/install.sh
RUN rm -rf build-afl-fast

# Install libfuzzer
ADD ./libfuzzer build-libfuzzer
RUN ./build-libfuzzer/install.sh
RUN rm -rf build-libfuzzer

# Install honggfuzz
ADD ./honggfuzz build-honggfuzz
RUN ./build-honggfuzz/install.sh
RUN rm -rf build-honggfuzz

CMD ["/bin/bash"]
