#! /bin/bash
set -euf
# git config!
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git_commit_msg.txt ~/.git_commit_msg.txt
# first rule vim
ln -sf ~/dotfiles/vimrc ~/.vimrc
# then rule inputrc based stuff
ln -sf ~/dotfiles/inputrc ~/.inputrc
# make sure undodir exits
mkdir -p "$HOME/.undodir/"
# install plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf ~/dotfiles/vimPlug ~/.vimPlug
# then tmux
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# add italic support in tmux and terminal
tic -x tmux.terminfo
tic xterm-256color-italic.terminfo
# add fish
# add other folders 
mkdir -p /home/unga/go/bin
mkdir -p /home/unga/.local/bin/
ln -s ~/dotfiles/config/fish/config.fish ~/.config/fish/
ln -s ~/dotfiles/config/fish/fishfile  ~/.config/fish/
ln -s ~/dotfiles/config/fish/conf.d/* ~/.config/fish/conf.d/
ln -s ~/dotfiles/config/fish/functions/* ~/.config/fish/functions/
