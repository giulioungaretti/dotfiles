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
        echo 'nvim'
        ln -sf "$f" "$HOME/.config/nvim/${f##*/}"
    elif [[ "$f" == "config" ]]; then
        echo 'i3'
        ln -sf "$f" "$HOME/.config/i3/${f##*/}"
    else
        ln -sf "$f" "$HOME/.${f##*/}"
    fi
done

echo removing

rm -f ~/.makeLinks.sh
rm -f ~/.README.md

echo done
echo 'set up plug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo 'set up tmux plugins'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
chsh -s $(which zsh)


echo 'set up colors'
git clone https://github.com/chriskempson/base16-shell.git $HOME/.zsh/base16-shell
touch $HOME/.config/nvim/.base16
