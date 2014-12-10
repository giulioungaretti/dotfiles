# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
############# exports ##########
TERM=xterm-256color
export TERM
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin"
export PATH=~/anaconda/bin:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PATH="$HOME/.tmuxifier/bin:$PATH"
export AWS_CREDENTIAL_FILE="/Users/giulio/.aws/config"
export GIT_EDITOR=vim
export VISUAL=gvim
export EDITOR=vim
###############################################################
#########################   aliases ########################
alias server='python -m SimpleHTTPServer'
alias win8='VBoxManage startvm win8 --type headless'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias tmux="TERM=screen-256color-bce tmux"
# files and mode manipulation
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
alias workstation='ssh giulio@172.20.3.114'
alias workstationX='ssh -X giulio@172.20.3.114'
alias mountsmb='~/Dropbox/Dotfiles/.mount.sh'
alias notebook='~/Dropbox/Dotfiles/.notebook.sh'
alias julia='/Applications/Julia-0.3.0-rd1-63c14c927f.app/Contents/Resources/julia/bin/julia'


# os awareness
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	if [ -f ~/.ubuntualias ]; then
              source ~/.ubuntualias
	  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
		if [ -f ~/.osxalias ]; then
              source ~/.osxalias
	  fi
fi

# enable vim mode on commmand line
# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
KEYTIMEOUT=0.1

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey -v
# remap jj to nesc
bindkey -M viins 'jj' vi-cmd-mode
# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^s' history-incremental-search-backward


##############
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL  ]] && . $BASE16_SHELL

#new vim mode
# vim-mode.plugin.zsh
#
# Author: Ben White
# URL: benjaminwhite.info

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

# Allow in
#bindkey -M vicmd 'ciw' 'bcw'
#bindkey -M vicmd 'diw' 'bdw'

# Stop weird behavior when hitting escape multiple times
noop () {}
zle -N noop
bindkey -M vicmd '\E' noop
