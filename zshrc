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
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim

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



zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select


# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
#eval "$(pyenv virtualenv-init -)"
#
#FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#disable tmux in fzf
export FZF_TMUX=1
#  use extended search  all the time
export FZF_DEFAULT_OPTS="--extended"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
