#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
echo copying

for f in ~/dotfiles/*
do
    echo "symlinking: "$f
    ln -sf "$f" "$HOME/.${f##*/}"
done

echo removing

rm -f ~/.makeLinks.sh
rm -f ~/.README.md

echo done

echo 'set up plug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo 'set zsh as shell'
chsh -s /bin/zsh 
echo 'getting zpreso'
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
echo 'set up tmux plugins'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
