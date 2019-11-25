#!/bin/bash

DOT_FILES=( .config/nvim .config/coc .hyper.js)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

sh ./brew.sh

echo "export LANG=ja_JP.UTF-8" >> ~/.config/fish/config.fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# curl -L raw.github.com/powerline/fonts/master/install.sh | bash

git clone https://github.com/powerline/fonts.git
sh fonts/install.sh
rm -rf fonts

# fisher add oh-my-fish/theme-bobthefish
