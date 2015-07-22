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
if [ !  "~/.vim/autoload/plug.vim " ]; then
        echo set up plug
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
