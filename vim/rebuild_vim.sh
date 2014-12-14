#!/bin/sh

# --------------------------------------------
# hg clone https://vim.googlecode.com/hg/ vim
# cd vim
# --------------------------------------------

echo "----- PULL"
hg pull && hg update tip

echo "----- CONFIGURE"
./configure --with-features=huge \
    --enable-multibyte \
    --enable-pythoninterp \
    --enable-python3interp \
    --enable-luainterp \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/home/andreas/opt

echo "----- COMPILE, INSTALL"
make && make install

echo "----- VERSION"
$HOME/opt/bin/vim --version

