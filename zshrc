#
# Executes commands at the start of an interactive session.
#
# Source Prezto. {{{
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
        source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
#}}}
# Exports # {{{
TERM=xterm-256color
export TERM
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim
# wor stuff
export AWS_CREDENTIAL_FILE="/Users/giulio/.aws/config"
#}}}
# Aliases {{{
alias server='python -m http.server'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias tmux="TERM=screen-256color-bce tmux"
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
KEYTIMEOUT=0.01
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
bindkey -M viins 'jk' vi-cmd-mode
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

## change iTerm profile{{{
## works only outside TMUX
## TODO find out how to make it work inside tmux
#it2prof() { echo -e "\033]50;SetProfile=$1\a" }
#term_theme="default"
#export term_theme
## function to make dark
#dark(){
        #term_bkg="dark"
        #export term_bkg
        #BASE16_SHELL="$HOME/.config/base16-shell/base16-$term_theme.$term_bkg.sh"
        #[[ -s $BASE16_SHELL  ]] && . $BASE16_SHELL &&\
        #echo -e "\033]50;SetProfile=dark\a" &&\
        #echo "switching theme to: "$term_theme "-"$term_bkg
#}
#light(){
        #term_bkg="light"
        #export term_bkg
        #BASE16_SHELL="$HOME/.config/base16-shell/base16-$term_theme.$term_bkg.sh"
        #[[ -s $BASE16_SHELL  ]] && . $BASE16_SHELL &&\
        #echo -e "\033]50;SetProfile=light\a" &&\
        #echo "switching theme to: "$term_theme"-"$term_bkg
#}
#}}}
 #------------------------------------------------------- gb tooling helpers.{{{
if [ -f /usr/local/bin/agb ]; then
        alias agb="source /usr/local/bin/agb"
fi
if [ -f /usr/local/bin/dgb ]; then
        alias dgb="source /usr/local/bin/dgb"
fi

#}}}
#vim: foldmethod=marker:foldlevel=0
