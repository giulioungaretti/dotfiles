#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
for f in ~/dotfiles/*
do
    ln -s "$f" "$HOME/.${f##*/}"
done