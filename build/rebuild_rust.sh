#!/bin/sh

# ./configure --prefix=$HOME/opt --enable-ccache && \

./configure --enable-ccache && \
    make -j -l 3 && \
    echo "run 'sudo make install' now.."
#    sudo make install
