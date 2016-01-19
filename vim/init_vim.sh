#!/bin/bash

if [ "`uname -o`" == "Msys" -o "`uname -o`" == "Cygwin" ]; then
    echo "running on WIN"
    pre="_"
else
    echo "running on LINUX"
    pre="."
fi

destdir="$HOME/.vim"
srcdir="$(dirname $(readlink -f $0))"

files=("$HOME/${pre}vimrc" "$HOME/${pre}gvimrc")

for f in "${files[@]}"; do
    if [ -f "$f" -o -L "$f" ]; then
        echo "removing $f"
        rm -f "$f"
    fi
done

cd "$HOME"

echo "linking vimrc to $HOME"
ln -s "$srcdir/vimrc" "${pre}vimrc"
echo "linking gvimrc to $HOME"
ln -s "$srcdir/gvimrc" "${pre}gvimrc"

if [ ! -d "$destdir" ]; then
    echo "creating $destdir"
    mkdir "$destdir"
fi

cd "$destdir"

if [ -L "extras" ]; then
    echo "removing old extras link"
    rm -f "extras"
fi
echo "linking extras to $destdir"
ln -s "$srcdir/extras" "extras"

if [ ! -d "autoload" ]; then
    echo "creating autload folder in $destdir"
    mkdir "autload"
fi

read -p "Starting vim and :PlugInstall-ing stuff.." -n1 -s
vim -c "PlugInstall" -c "qall"; reset

echo "done"
