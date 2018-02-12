# Prezto {{{
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
        source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# }}}
# Source {{{

# OS awareness # {{{
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        if [ -f ~/.ubuntualias ]; then
                source ~/.ubuntualias
        fi
        export PATH="$(yarn global bin):$PATH"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        if [ -f ~/.osxalias ]; then
                source ~/.osxalias
        fi
    if [ -f $(brew --prefix)/etc/brew-wrap ];then
      source $(brew --prefix)/etc/brew-wrap
    fi
fi

# }}}
# }}}
# options {{{
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
# }}}
# Exports # {{{
[[ $TMUX = "" ]] && export TERM="xterm-256color-italic"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export VISUAL=vim
#disable tmux in fzf
export FZF_TMUX=1
#  use extended search  all the time
# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
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
alias irssi='TERM=screen-256color irssi'
alias ll='ls -lG'
#}}}
# vi mode {{{
# fix vim mode on commmand line {{{
# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
KEYTIMEOUT=21
export KEYTIMEOUT

# remap jj to nesc
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode
# edit in vim
bindkey -v
# Multi-level undo
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo


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
# fzf  {{{
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
# cosmetic cursors {{{
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
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

zle -N edit-command-line
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
# }}}
# version managers {{{
if [ -d "${PYENV_ROOT}" ]; then
   export PATH="${PYENV_ROOT}/bin:${PATH}"
   eval "$(pyenv init -)"
   # this is really slow for some reasons
   # eval "$(pyenv virtualenv-init -)"
fi
# add n stuff to path
export PATH="$HOME/n/bin/":${PATH}

# add  haskell bin tools to path
export PATH="$HOME/.local/bin":${PATH}

# source secrets file if exist
[ -f ~/dotfiles/SECRETS.sh ]  && source ~/dotfiles/SECRETS.sh
# }}}
function chpwd {
    if [ -f $(pwd)/.workspace.json ]; then
        python ~/dotfiles/bin/watch
    fi
}
#magic tmux temp session
function  ta (){
    local NEW_SESSION=$(uuidgen)
    tmux new-session -t $1 -s $NEW_SESSION; echo "DONE";  tmux kill-session -t $NEW_SESSION
}
# vim: foldmethod=marker sw=4 ts=4 sts=4 et tw=78
