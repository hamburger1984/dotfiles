#!/bin/sh

set -e

figlet "lxqt build tools"
mkdir -p ./lxqt-build-tools/build/
pushd ./lxqt-build-tools/build/ > /dev/null
git pull;
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make -j -l 5
sudo make install
popd > /dev/null


figlet qtermwidget
mkdir -p ./qtermwidget/build/
pushd ./qtermwidget/build/ > /dev/null
git pull;
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make -j -l 5
sudo make install
popd > /dev/null


figlet qterminal
mkdir -p ./qterminal/build/
pushd ./qterminal/build/ > /dev/null
git pull;
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make -j -l 5
sudo make install
popd > /dev/null
