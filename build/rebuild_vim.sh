#!/bin/sh

set -e

#     --enable-pythoninterp=dynamic \
#     --enable-python3interp=dynamic \

#     --enable-perlinterp=no \
#     --enable-pythoninterp=no \
#     --enable-python3interp=yes \
#     --enable-rubyinterp=yes \
#     --with-tlib=ncurses \

PREFIX="$HOME/.opt"

echo "----- CONFIGURE"
./configure \
    --enable-fail-if-missing \
    --enable-cscope \
    --enable-fontset \
    --enable-gpm \
    --enable-gui=gtk3 \
    --enable-luainterp=dynamic \
    --enable-perlinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-tclinterp=dynamic \
    --with-features=huge \
    --with-luajit \
    --with-tlib=ncurses \
    --prefix=$PREFIX &&
echo "----- COMPILE, INSTALL" &&
make -j -l 3 && make install &&
echo "----- VERSION" &&
which vim &&
vim --version
