#!/bin/sh

echo "----- CONFIGURE"
./configure \
    --enable-cscope \
    --enable-fontset \
    --enable-gpm \
    --enable-gui=gtk2 \
    --enable-luainterp=dynamic \
    --enable-perlinterp=dynmic \
    --enable-python3interp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-tclinterp=dynamic \
    --with-features=huge \
    --with-luajit \
    --prefix=/home/andreas/opt

echo "----- COMPILE, INSTALL"
make -j -l 4 && make install

echo "----- VERSION"
which vim
vim --version
