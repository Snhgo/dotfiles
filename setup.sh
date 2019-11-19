#!/bin/bash

DOT_FILES=( .zshrc .config/nvim .config/coc .zplug .hyper.js)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

sh ./brew.sh
