#
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
# add imageJ and other apps in opt
export PATH=$PATH:/home/giulio/.opt
export PATH=~/anaconda/bin:$PATH
export PATH=/usr/local/MATLAB/R2013b/bin:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PATH="$HOME/.tmuxifier/bin:$PATH"

export GIT_EDITOR=vim
export VISUAL=macvim
export EDITOR=vim
###############################################################
#########################   aliases #########################
alias server='python -m SimpleHTTPServer 8000'
alias win8='VBoxManage startvm win8 --type headless'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
#alias tmux='tmux  -u'
#alias tmu='tmux -u'
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
alias nb='ipython notebook --profile=nbserver'
alias nbl='ipython notebook --profile=default-light'
alias nbd='ipython notebook --profile=default-dark'
alias mountsmb='~/Dropbox/Dotfiles/.mount.sh'
alias notebook='~/Dropbox/Dotfiles/.notebook.sh'
alias julia='/Applications/Julia-0.3.0-rd1-63c14c927f.app/Contents/Resources/julia/bin/julia'

if [ -f ~/.osxalias ]; then
	source ~/.osxalias
else
    :
fi

if [ -f ~/.ubuntualias ]; then
	source ~/.ubuntualias
else
    :
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
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.light.sh"
[[ -s $BASE16_SHELL  ]] && . $BASE16_SHELL

eval "$(tmuxifier init -)"

