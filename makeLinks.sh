#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
echo copying

for f in ~/dotfiles/*
do
    echo "symlinking: "$f
    if [[ "$f" == "init.vim" ]]; then
        ln -sf "$f" "$HOME/.config/nvim/${f##*/}"
    elif [[ "$f" == "config" ]]; then
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	    ln -sf "$f" "$HOME/.config/i3/${f##*/}"
	fi
    elif [[ "$f" == "Brewfile" ]] ; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            ln -sf "$f" "$HOME/.brewfile/${f##*/}"
        fi
    else
        ln -sf "$f" "$HOME/.${f##*/}"
    fi
done

rm -f ~/.makeLinks.sh
rm -f ~/.README.md

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'set up tmux plugins'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo 'getting zpreso'
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
chsh -s "$(which zsh)"


mkdir "$HOME/.undodir/"
