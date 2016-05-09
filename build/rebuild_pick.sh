#!/bin/sh

PREFIX="$HOME/opt"
./autogen.sh && \
    ./configure --exec_prefix="$PREFIX" --prefix="$PREFIX" && \
    make -j && \
    make install
