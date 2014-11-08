#!/bin/sh

# git clone https://github.com/python/cpython.git
# cd cpython

git pull && \
    ./configure --prefix=$HOME/opt --exec_prefix=$HOME/opt && \
    make -j && \
    make install

python3 --version
