#!/bin/sh

# ./configure --prefix=$HOME/opt --enable-ccache && \

./configure --enable-ccache && \
    make -j -l 3 && \
    sudo make install
