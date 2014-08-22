#!/bin/sh

## copy into root directory of cloned vim repository
## $ git clone https://github.com/b4winckler/vim.git
## $ cd vim
## $ sh rebuild_vim.sh

echo "----- PULL"
git pull

echo "----- CONFIGURE"
./configure --with-features=huge --enable-python3interp --enable-luainterp --enable-multibyte --prefix=$HOME/opt

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

