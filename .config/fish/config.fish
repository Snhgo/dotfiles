export LANG=ja_JP.UTF-8
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8

# eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
set -x PATH ~/.anyenv/bin $PATH
anyenv init - fish | source

## python
set -x PYENV_ROOT $HOME/.anyenv/envs/pyenv
if command -v pyenv 1>/dev/null 2>&1
  eval (pyenv init - | source)
  eval (pyenv virtualenv-init - | source)
end

## ruby
set -x RBENV_ROOT $HOME/.anyenv/envs/rbenv
if command -v rbenv 1>/dev/null 2>&1
  eval (rbenv init - | source)
end

## node
set -x NODENV_ROOT $HOME/.anyenv/envs/nodenv
#export PATH="$NODENV_ROOT/bin:$PATH"
if command -v nodenv 1>/dev/null 2>&1
  eval (nodenv init - | source)
end

## alias
alias v='nvim'
alias g='git'
alias pe='pyenv'
alias pe='pyenv'
alias pev='pyenv virtualenv'

##
set -g theme_color_scheme solarized
set -g theme_display_git yes



