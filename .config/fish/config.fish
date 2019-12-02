export LANG=ja_JP.UTF-8
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8

## python
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $HOME/.pyenv/bin $PATH
if command -v pyenv 1>/dev/null 2>&1
	eval (pyenv init - | source)
	eval (pyenv virtualenv-init - | source)
end

## ruby
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
if command -v rbenv 1>/dev/null 2>&1
eval (rbenv init - | source)
end

## node
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
if command -v nodenv 1>/dev/null 2>&1
eval (nodenv init - | source)
end


## alias
alias v='nvim'
alias pe='pyenv'
alias pe='pyenv'
alias pev='pyenv virtualenv'

##
set -g theme_color_scheme solarized
set -g theme_display_git yes

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
