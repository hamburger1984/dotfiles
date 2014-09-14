#!/bin/sh

echo "----- PULL"
git pull

echo "----- CONFIGURE"
# ./configure --with-features=huge --enable-python3interp --enable-luainterp --enable-multibyte --prefix=$HOME/opt
./configure --with-features=huge --enable-python3interp --enable-luainterp --enable-multibyte --enable-gui=gtk2 --prefix=/home/andreas/opt

echo "----- COMPILE, INSTALL"
make && make install

echo "----- VERSION"
$HOME/opt/bin/vim --version

echo "----- LN to $HOME/bin"
for f in vim vimtutor gvim ; do
    if [ -f $HOME/bin/$f ]; then
        rm -f $HOME/bin/$f
    fi
    ln -s $HOME/opt/bin/$f $HOME/bin/$f
done

