#!/bin/sh

./autogen.sh && \
    ./configure --exec_prefix="/home/andreas/opt" --prefix="/home/andreas/opt" && \
    make -j && \
    make install
