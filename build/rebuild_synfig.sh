#!/bin/sh

prefix=~/opt
export PKG_CONFIG_PATH="$prefix/lib/pkgconfig"
export PATH="$(pwd)/synfig-core/src/tool/.libs:$PATH"

cd ./ETL &&
    autoreconf --install --force &&
    ./configure --prefix $prefix &&
    make --debug=b install &&
    cd ../synfig-core &&
    libtoolize --copy --force &&
    autoreconf --install --force &&
    ./configure --prefix $prefix --enable-optimization=0 --enable-debug &&
    make --debug=b -j -l 3 install &&
    cd ../synfig-studio &&
    autoreconf --install --force &&
    intltoolize --force --copy &&
    ./configure --prefix $prefix --enable-optimization=0 --enable-debug &&
    make --debug=b -j -l 3 install
