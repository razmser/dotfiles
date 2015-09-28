#!/bin/bash

rm -rf ~/backup
mkdir ~/backup
mv ~/.zshrc ~/backup
mv ~/.vimrc ~/backup
mv /etc/tmux.conf ~/backup

ln -s $(pwd)/zshrc ~/.zshrc
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/tmux.conf /etc/tmux.conf

