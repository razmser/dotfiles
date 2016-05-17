#!/bin/bash

rm -rf ~/backup
mkdir ~/backup
mv ~/.zshrc ~/backup
mv ~/.vimrc ~/backup
mv ~/.tmux.conf ~/backup
mv ~/.config/Terminal/terminalrc ~/backup
mv ~/.vim/colors/solarized.vim ~/backup
mkdir -p ~/.config/Terminal/
mkdir -p ~/.vim/colors/

ln -s $(pwd)/zshrc ~/.zshrc
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/tmux.conf ~/.tmux.conf
ln -s $(pwd)/solarized/xfce4-terminal/dark/terminalrc ~/.config/Terminal/terminalrc
ln -s $(pwd)/solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim

# Powerline(for tmux and vim)
sudo pip install powerline-status

# Fonts
mkdir -p ~/.fonts
cp $(pwd)/fonts/* ~/.fonts

# Midnight commander solarized skin
mkdir -p ~/.local/share/mc/skins
ln -s $(pwd)/solarized.ini ~/.local/share/mc/skins/solarized.ini

