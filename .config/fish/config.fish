export LANG=ja_JP.UTF-8

## python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval (pyenv init - | source)
eval (pyenv virtualenv-init - | source)

## ruby
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval (rbenv init - | source)

## node
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
eval (nodenv init - | source)


## alias
alias v='nvim'
alias pe='pyenv'
alias pe='pyenv'
alias pev='pyenv virtualenv'

##
set -g theme_color_scheme solarized
set -g theme_display_git yes

