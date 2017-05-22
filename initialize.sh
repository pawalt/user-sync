#!/usr/bin/env bash

echo "source ~/user-sync/vimrc" > ~/.vimrc
ln -s ~/user-sync/vim ~/.vim

echo ". ~/user-sync/bash_aliases" > ~/.bash_aliases
echo ". ~/user-sync/bashrc" > ~/.bashrc

echo "source ~/user-sync/config.fish" > ~/.config/fish/config.fish

ln -s user-sync/taskrc .taskrc

wget -O xt  http://git.io/v6JYg && chmod +x xt && ./xt && rm xt

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
