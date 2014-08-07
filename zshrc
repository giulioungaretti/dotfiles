# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="norm"
export CLICOLOR=1
source $ZSH/oh-my-zsh.sh

# User configuration
#add usr local bin befeore usr/bin for homebrew 26-arpril-2014
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin"
# add imageJ and other apps in opt
export PATH=$PATH:/home/giulio/.opt
export PATH=~/anaconda/bin:$PATH
export PATH=/usr/local/MATLAB/R2013b/bin:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
plugins=(git sublime)

###############################################################
#########################   aliases ##########################
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
alias mountsmb='~/Dropbox/Dotfiles/.mount.sh'
alias notebook='~/Dropbox/Dotfiles/.notebook.sh'
alias thesis="cd ~/Dropbox/Documents/Uni/Master/Thesis/"
alias julia='/Applications/Julia-0.3.0-rc1-63c14c927f.app/Contents/Resources/julia/bin/julia'
if [ -f ~/.osxalias ]; then
	source ~/.osxalias
else
        print "404: ~/.osxalias not found."
fi

if [ -f ~/.ubuntualias ]; then
	source ~/.ubuntualias
else
        print "404: ~/.osxalias not found."
fi
# enable vim mode on commmand line
# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
#KEYTIMEOUT=1

# show vim status
# http://zshwiki.org/home/examples/zlewidgets
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey -v
# rempa jj to nesc
bindkey -M viins 'jj' vi-cmd-mode
#
# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^s' history-incremental-search-backward
