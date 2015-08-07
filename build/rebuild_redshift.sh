#!/bin/sh

./bootstrap && \
    ./configure && \
    make -j -l 3 && \
    sudo make install
