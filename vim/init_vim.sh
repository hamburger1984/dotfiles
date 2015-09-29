#!/bin/sh

if [ -d ~/.vim ]; then
    rm -rf ~/.vim
fi

if [ -f ~/.vimrc ]; then
    rm -f ~/.vimrc
fi

if [ -f ~/.gvimrc ]; then
    rm -f ~/.gvimrc
fi


dir=`pwd`


# fetch plug.vim to $HOME/.vim/autoload
mkdir -p "$HOME/.vim/autoload/"
cd "$HOME/.vim/autoload/"
wget "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"


cd "$HOME"
ln -s "$dir/vimrc" ".vimrc"
ln -s "$dir/gvimrc" ".gvimrc"

cd "$HOME/.vim/" > /dev/null
ln -s "$dir/vim_plugins.vim" "plugins.vim"
ln -s "$dir/extras" "extras"

echo "START VIM AND RUN :PlugInstall<CR> NOW.."
