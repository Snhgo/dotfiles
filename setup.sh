#!/bin/bash

DOT_FILES=( .config/nvim .config/coc .hyper.js)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

sh ./brew.sh

# fishの設定
echo "export LANG=ja_JP.UTF-8" >> ~/.config/fish/config.fish

fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# powerlineのfontのダウンロード
git clone https://github.com/powerline/fonts.git
sh fonts/install.sh
rm -rf fonts

# fishのプロンプトのテーマの設定
fisher add oh-my-fish/theme-bobthefish
