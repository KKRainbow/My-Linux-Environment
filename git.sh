#!/usr/bin/env bash

install() 
{
  sudo apt-get install $1 -y -qq
}

git config --global user.email "sunsijie@buaa.edu.cn"
git config --global user.name "孙思杰"
git config --global push.default simple

# 检查依赖
install vim
git config --global core.editor "vim"

install meld
git config --global diff.tool "meld"
