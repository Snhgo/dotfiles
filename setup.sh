#!/bin/bash

DOT_FILES=( .zshrc .config/nvim .zplug .globalrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
