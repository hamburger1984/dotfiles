#!/bin/sh

set -e

PREFIX="$HOME/opt"

if [ ! -d build ]; then
    mkdir build
fi

cd build; cmake ..; make -j -l 2; sudo make install
