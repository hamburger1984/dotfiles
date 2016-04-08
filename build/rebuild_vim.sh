#!/bin/sh

echo "----- CONFIGURE"
./configure \
    --enable-fail-if-missing \
    --enable-cscope \
    --enable-fontset \
    --enable-gpm \
    --enable-gui=gtk3 \
    --enable-luainterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-tclinterp=dynamic \
    --with-features=huge \
    --with-luajit \
    --with-tlib=ncurses \
    --prefix=/home/andreas/opt

#     --enable-perlinterp=no \
#     --enable-pythoninterp=no \
#     --enable-python3interp=yes \
#     --enable-rubyinterp=yes \
#     --with-tlib=ncurses \

echo "----- COMPILE, INSTALL"
make -j -l 4 && make install

echo "----- VERSION"
which vim
vim --version
