#
# Executes commands at the start of an interactive session.
#
# Source. {{{
# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
        source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# tmuxminator
if [[ -s "$HOME/bin/tmuxinator.zsh" ]]; then
        source "$HOME/bin/tmuxinator.zsh"
fi
#}}}
# Exports # {{{
export TERM=screen-256color
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim
# black bg
export VIMBKG=d
#disable tmux in fzf
export FZF_TMUX=0
#  use extended search  all the time
export FZF_DEFAULT_OPTS="--extended"
# work  stuff
export AWS_CREDENTIAL_FILE="/Users/giulio/.aws/config"
#}}}
# Aliases {{{
alias server='python -m http.server'
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
# Base16 Shell
dark(){
        BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
        [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
}
light(){
        BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.light.sh"
        [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
}
dark
# tty
color00="1d1f21" # Base 00 - Black
color01="cc6666" # Base 08 - Red
color02="b5bd68" # Base 0B - Green
color03="f0c674" # Base 0A - Yellow
color04="81a2be" # Base 0D - Blue
color05="b294bb" # Base 0E - Magenta
color06="8abeb7" # Base 0C - Cyan
color07="c5c8c6" # Base 05 - White
color08="969896" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="ffffff" # Base 07 - Bright White
# 16 color space
echo -e "\e]P0$color00"
echo -e "\e]P1$color01"
echo -e "\e]P2$color02"
echo -e "\e]P3$color03"
echo -e "\e]P4$color04"
echo -e "\e]P5$color05"
echo -e "\e]P6$color06"
echo -e "\e]P7$color07"
echo -e "\e]P8$color08"
echo -e "\e]P9$color09"
echo -e "\e]PA$color10"
echo -e "\e]PB$color11"
echo -e "\e]PC$color12"
echo -e "\e]PD$color13"
echo -e "\e]PE$color14"
echo -e "\e]PF$color15"
clear #for background artifacting
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
# vim: foldmethod=marker
