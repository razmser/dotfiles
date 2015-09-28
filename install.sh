#!/bin/bash

mkdir ~/backup 2> /dev/null
mv ~/.zshrc ~/backup 2> /dev/null
mv ~/.vimrc ~/backup 2> /dev/null
mv ~/.tmux.conf ~/backup 2> /dev/null

ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

