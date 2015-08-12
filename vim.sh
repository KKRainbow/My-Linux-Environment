#!/usr/bin/env zsh

source ./common.sh

install vim
cat ./configs/vimrc > ~/.vimrc

mkdir -p ~/.vim/bundle/
#下载Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#安装插件
vim +BundleInstall +qall
