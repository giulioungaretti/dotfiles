# Executes commands at the start of an interactive session.
#
# Source. {{{
# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
        source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
#}}}
# Exports # {{{
export TERM=screen-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim
# black bg
export VIMBKG=d
#disable tmux in fzf
export FZF_TMUX=1
#  use extended search  all the time
export FZF_DEFAULT_OPTS="--extended"
# work  stuff
export AWS_CREDENTIAL_FILE="/Users/giulio/.aws/config"
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
# OS awareness # {{{
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        if [ -f ~/.ubuntualias ]; then
                source ~/.ubuntualias
        fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
        if [ -f ~/.osxalias ]; then
                source ~/.osxalias
        fi
	# ssh color change tab
	# iTerm2 tab color commands
	# http://code.google.com/p/iterm2/wiki/ProprietaryEscapeCodes
	if [[ -n "$ITERM_SESSION_ID" ]]; then
	    tab-color() {
		echo -ne "\033]6;1;bg;red;brightness;$1\a"
		echo -ne "\033]6;1;bg;green;brightness;$2\a"
		echo -ne "\033]6;1;bg;blue;brightness;$3\a"
	    }
	    tab-red() { tab-color 255 0 0 }
	    tab-green() { tab-color 0 255 0 }
	    tab-blue() { tab-color 0 0 255 }
	    tab-reset() { echo -ne "\033]6;1;bg;*;default\a" }

	    function iterm2_tab_precmd() {
		tab-reset
	    }

	    function iterm2_tab_preexec() {
		if [[ "$1" =~ "^ssh " ]]; then
		    if [[ "$1" =~ "prod" ]]; then
			tab-color 255 160 160
		    else
			tab-color 160 255 160
		    fi
		else
		    tab-color 031 031 031
		fi
	    }

	    autoload -U add-zsh-hook
	    add-zsh-hook precmd  iterm2_tab_precmd
	    add-zsh-hook preexec iterm2_tab_preexec
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

# Allow in
#bindkey -M vicmd 'ciw' 'bcw'
#bindkey -M vicmd 'diw' 'bdw'

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
#}}}
#------------------------------------------------------------ colors {{{
#TODO fix for hybrind color scheme
# }}}
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
DIR=$HOME"/bin"
if [ -f $DIR/agb ]; then
        alias agb="source $DIR/agb"
fi
if [ -f $DIR/dgb ]; then
        alias dgb="source $DIR/dgb"
fi
# vim: foldmethod=marker
