#!/bin/sh

set -e

./bootstrap && \
    ./configure && \
    make -j -l 3 && \
    sudo make install
