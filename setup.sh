#!/bin/bash

DOT_FILES=( .config/nvim .config/coc .config/efm-langserver .hyper.js )

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

## pythonの設定
# neovim
pyenv install 2.7.15
pyenv virtualenv 2.7.15 neovim2
pyenv activate neovim2
pip2 install neovim
pyenv which python

pyenv install 3.7.3
pyenv virtualenv 3.7.3 neovim3
pyenv activate neovim3
pip install neovim
pip install jedi
pyenv which python


## ruby
rbenv init
rbenv install 2.5.1
rbenv global 2.5.1
gem install neovim

## node
nodenv init
nodenv install 13.1.0
nodenv global 13.1.0
npm install --global neovim
