
##
# ~/.zshrc
##
# {{{ setopt
setopt auto_menu
setopt correct
setopt auto_name_dirs
setopt auto_remove_slash
setopt extended_history
setopt hist_ignore_dups
setopt pushd_ignore_dups
setopt rm_star_silent
setopt sun_keyboard_hack
setopt extended_glob
setopt hist_ignore_all_dups
setopt no_beep
setopt sh_word_split
setopt auto_param_keys
setopt auto_pushd
setopt list_packed
setopt list_types
setopt no_case_glob
setopt complete_in_word

setopt prompt_subst

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
setopt auto_param_slash

# show japanese character
setopt print_eight_bit

# 範囲指定できるようにする
# 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる
setopt brace_ccl

# C-s, C-qを無効にする。
setopt no_flow_control

# 先頭がスペースならヒストリーに追加しない。
setopt hist_ignore_space

# hide rprompt after execute the command.
setopt transient_rprompt

# treat comment after sharp.
setopt interactive_comments

# do not share history within shells
unsetopt share_history

# ディレクトリ名だけで移動できる。
setopt auto_cd
#cdpath=(.. ~ ~/src)
# }}}
# {{{ basic zsh behavior

# 補完
autoload -Uz compinit && compinit

bindkey -e

bindkey \^U backward-kill-line

# 色を使用
autoload -Uz colors && colors

# Show the execution consumed resource
# If the command takes over following sec.
REPORTTIME=2

## git
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' max-exports 6 # formatに入る変数の最大数
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
setopt prompt_subst
function vcs_echo {
    local st branch color
    STY= LANG=en_US.UTF-8 vcs_info
    st=`git status 2> /dev/null`
    if [[ -z "$st" ]]; then return; fi
    branch="$vcs_info_msg_0_"
    if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} #staged
    elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
    elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[blue]} # untracked
    else color=${fg[cyan]}
    fi
    echo "%{$color%}(%{$branch%})%{$reset_color%}" | sed -e s/@/"%F{yellow}@%f%{$color%}"/
}
PROMPT='
%F{yellow}[%~]%f `vcs_echo`
%(?.$.%F{red}$%f) '


## エイリアス
alias v='nvim'
alias ll='ls -la'
alias grep='grep --color'
alias df='df -h'
alias ps='ps --sort=start_time'

## zplug
if [ -e "${HOME}/.zplug" ]; then
    source ~/.zplug/init.zsh

  zplug "b4b4r07/enhancd", use:enhancd.sh


  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  # Then, source plugins and add commands to $PATH
  zplug load --verbose


fi

## nvim
export XDG_CONFIG_HOME=$HOME/.config

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
