# Executes commands at the start of an interactive session.
#
# Source. {{{
# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
        source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
#}}}
# Exports # {{{
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
if [ -x  "$(command -v nvim)" ]; then
  export GIT_EDITOR=nvim
  export VISUAL=nvim
  export EDITOR=nvim
  alias vim=nvim
else
    echo does not exist
fi
#disable tmux in fzf
export FZF_TMUX=1
#  use extended search  all the time
export FZF_DEFAULT_OPTS="--extended"
#}}}
# Aliases {{{
alias server='python3 -m http.server'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias r+='chmod +r'
alias w+='chmod +w'
alias x+='chmod +x'
alias r-='chmod -r'
alias w-='chmod -w'
alias x-='chmod -x'
alias rw-='chmod 600'
alias rwx='chmod 700'
alias r--='chmod 644'
alias r-x='chmod 755'
#}}}
#source colors
source "$HOME/dotfiles/color"
# OS awareness # {{{
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        if [ -f ~/.ubuntualias ]; then
                source ~/.ubuntualias
        fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
        if [ -f ~/.osxalias ]; then
                source ~/.osxalias
        fi
fi
#}}}
# vi mode {{{
# fix vim mode on commmand line {{{
# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
KEYTIMEOUT=11
export KEYTIMEOUT
#}}}
# remap jj to nesc
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode
# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey -v
# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^s' history-incremental-search-backward
bindkey -v
# Multi-level undo
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo

# Allow backspacing past where you started in insert mode
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Incrememntal search
bindkey -M vicmd '/' history-incremental-search-backward
bindkey -M viins '^R' history-incremental-search-backward

# Allow Ctrl-P and Ctrl-N in insert mode
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Edit in vim
bindkey -M vicmd v edit-command-line

# Stop weird behavior when hitting escape multiple times
noop () {}
zle -N noop
bindkey -M vicmd '\E' noop
#}}}
#}}}
#------------------------------------------------------- gb tooling helpers.{{{
if [ -f /usr/local/bin/agb ]; then
        alias agb="source /usr/local/bin/agb"
fi
if [ -f /usr/local/bin/dgb ]; then
        alias dgb="source /usr/local/bin/dgb"
fi
DIR=$HOME"/bin"
if [ -f $DIR/agb ]; then
        alias agb="source $DIR/agb"
fi
if [ -f $DIR/dgb ]; then
        alias dgb="source $DIR/dgb"
fi
#}}}
#------------------------------------------------------------------- fzf  {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#List all vagrant boxes available in the system including its status, and try to access the selected one via ssh
vs(){
        cd $(cat ~/.vagrant.d/data/machine-index/index | jq '.machines[] | {name, vagrantfile_path, state}' | jq '.name + "," + .state  + "," + .vagrantfile_path'| sed 's/^"\(.*\)"$/\1/'| column -s, -t | sort -rk 2 | fzf | awk '{print $3}'); vagrant ssh
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   -
fe() {
        local file
        file=$(fzf -x --query="$1" --select-1 --exit-0)
        [ -n "$file" ] && ${EDITOR:-vim} "$file"
}
# fd - cd to selected directory
fd() {
        local dir
        dir=$(find ${1:-*} -path '*/\.*' -prune \
                -o -type d -print 2> /dev/null | fzf +m) &&
                cd "$dir"
}
# cdf - cd into the directory of the selected file
ccdf() {
        local file
        local dir
        file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}
# fkill - kill process
fkill() {
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

        if [ "x$pid" != "x" ]
        then
                kill -${1:-9} $pid
        fi
}
#}}}
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ll='ls -lG'
function print_dcs
{
  print -n -- "\EP$1;\E$2\E\\"
}

function set_cursor_shape
{
  if [ -n "$TMUX" ]; then
    # tmux will only forward escape sequences to the terminal if surrounded by
    # a DCS sequence
    print_dcs tmux "\E]50;CursorShape=$1\C-G"
  else
    print -n -- "\E]50;CursorShape=$1\C-G"
  fi
}

function zle-keymap-select zle-line-init
{
  case $KEYMAP in
    vicmd)
      set_cursor_shape 0 # block cursor
      ;;
    viins|main)
      set_cursor_shape 1 # line cursor
      ;;
  esac
  zle reset-prompt
  zle -R
}

function zle-line-finish
{
  set_cursor_shape 0 # block cursor
}
# pyenv
export PYENV_ROOT="${HOME}/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
fi
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
# vim: foldmethod=marker
#
