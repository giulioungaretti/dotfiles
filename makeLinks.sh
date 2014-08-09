#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
for f in ~/dotfiles/*
do
    ln -sf "$f" "$HOME/.${f##*/}"
done
