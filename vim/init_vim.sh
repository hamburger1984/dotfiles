#!/bin/sh

files=("$HOME/.vimrc" "$HOME/.gvimrc")
for f in "${files[@]}"; do
    if [ -f "$f" ]; then
        echo "removing $f"
        rm -f "$f"
    fi
done

if [ "`uname -o`" == "Msys" ]; then
    folder="$HOME/vimfiles"
else
    folder="$HOME/.vim"
fi
if [ -d "$folder" ]; then
    echo "removing $folder"
    rm -rf "$folder"
fi

dir=`pwd`


# fetch plug.vim to $HOME/.vim/autoload
mkdir -p "$folder/autoload/"
cd "$folder/autoload/"
echo "fetching plug.vim to $folder/autoload/"
curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" \
    --output plug.vim


cd "$HOME"
echo "linking [g]vimrc to $HOME"
ln -s "$dir/vimrc" ".vimrc"
ln -s "$dir/gvimrc" ".gvimrc"

cd "$folder"
ln -s "$dir/extras" "extras"

echo "START VIM AND RUN :PlugInstall<CR> NOW.."
