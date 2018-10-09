#!/usr/bin/env sh

update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-8 200
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-8 200
update-alternatives --config clang
update-alternatives --config clang++

update-alternatives --install \
        /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-8  200 \
--slave /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-8 \
--slave /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-8 \
--slave /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-8 \
--slave /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-8 \
--slave /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-8 \
--slave /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-8 \
--slave /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-8 \
--slave /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-8 \
--slave /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-8 \
--slave /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-8 \
--slave /usr/bin/llvm-mcmarkup     llvm-mcmarkup    /usr/bin/llvm-mcmarkup-8 \
--slave /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-8 \
--slave /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-8 \
--slave /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-8 \
--slave /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-8 \
--slave /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-8 \
--slave /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-8 \
--slave /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-8 \
--slave /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-8 \
--slave /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-8 \

