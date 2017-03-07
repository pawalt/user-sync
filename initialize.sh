#!/usr/bin/env bash

echo "source ~/user-sync/vimrc" > ~/.vimrc

ln -s ~/user-sync/vim ~/.vim

echo ". ~/user-sync/bash_aliases" > ~/.bash_aliases
