#!/bin/sh

set -e

PREFIX="$HOME/.opt"

figlet falkon
mkdir -p ./build/
pushd ./build/ > /dev/null
git pull;
cmake -DCMAKE_INSTALL_PREFIX="$PREFIX" ..
make -j -l 5
make install
popd > /dev/null
