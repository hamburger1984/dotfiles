#!/bin/sh

./autogen.sh && \
    ./configure --prefix=/home/andreas/opt --disable-libtool-lock && \
    make -j -l 4.0

# ./autogen.sh && \
#     ./configure --prefix=/home/andreas/opt --disable-libtool-lock CC="ccache gcc" && \
#     make -j -l 4.0