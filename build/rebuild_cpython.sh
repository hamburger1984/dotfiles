#!/bin/sh

set -e

# git clone https://github.com/python/cpython.git
# cd cpython

#git pull && \
./configure --prefix=$HOME/.opt --exec_prefix=$HOME/.opt && \
    make -j -l 3 && \
    make install

python3 --version
