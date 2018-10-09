# universal-fuzzing-docker

Docker container containing as many fuzzers as I bother to include.

Supports the following fuzzers currently:

* afl
* afl-fast
* libfuzzer (through LLVM)
* honggfuzz

You may need to run the docker container with the `ptrace` capability and set the
`/proc/sys/kernel/core_pattern` value to something without a pipe.
