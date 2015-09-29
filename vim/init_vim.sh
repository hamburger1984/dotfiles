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
pushd "$HOME/.vim/autoload/" > /dev/null
wget "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
popd > /dev/null


pushd "$HOME" > /dev/null
ln -s "$dir/vimrc" ".vimrc"
ln -s "$dir/gvimrc" ".gvimrc"
popd > /dev/null

pushd "$HOME/.vim/" > /dev/null
ln -s "$dir/vim_plugins.vim" "plugins.vim"
ln -s "$dir/extras" "extras"
popd > /dev/null

echo "start vim and run :PlugInstall<CR> now.."
