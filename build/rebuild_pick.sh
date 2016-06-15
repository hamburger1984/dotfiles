#!/bin/sh

set -e

# PREFIX="$HOME/opt"
# ./autogen.sh && \
#     ./configure --exec_prefix="$PREFIX" --prefix="$PREFIX" && \
#     make -j && \
#     make install

./autogen.sh && \
    ./configure && \
    make -j -l 4.0 && \
    sudo make install
