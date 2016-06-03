#!/bin/sh

set -e

if [ ! -d build ] ; then
    mkdir build
fi


alias km='cmake -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` ..; make -j -l 3'
cd build && km && sudo make install

