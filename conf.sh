#! /bin/bash
set -euf 
echo "setting up vim"
# first rule vim
ln -sf ~/dotfiles/vimrc ~/.vimrc
# then rule inputrc based stuff
ln -s ~/dotfiles/inputrc ~/.inputrc
# make sure undodir exits
mkdir -p "$HOME/.undodir/"
# install plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf ~/dotfiles/vimPlug ~/.vimPlug
echo "setting up tmux"
# then tmux
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf 

echo 'set up tmux plugins'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "setting up x-server"
    ln -sf ~/dotfiles/xinitrc ~/.xinitrc 
    ln -sf ~/dotfiles/Xmodmap ~/.Xmodmap
fi
# there may be more linking needed depening on hardware
# for example touchpads 
echo "zprezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/zpreztorc ~/.zpreztorc
