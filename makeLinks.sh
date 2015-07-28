#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
echo copying

for f in ~/dotfiles/*
do
    ln -sf "$f" "$HOME/.${f##*/}"
done

echo removing

rm -f ~/.makeLinks.sh
rm -f ~/.README.md

echo done
