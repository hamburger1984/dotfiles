#!/bin/sh

set -e

# PREFIX="$HOME/.opt"
# ./autogen.sh && \
#     ./configure --exec_prefix="$PREFIX" --prefix="$PREFIX" && \
#     make -j -l 3 && \
#     make install

./autogen.sh && \
    ./configure && \
    make -j -l 3 && \
    sudo make install
