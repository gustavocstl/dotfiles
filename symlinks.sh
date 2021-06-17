#!/bin/bash
echo "╠═╦═Symlinks setup"

if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir $HOME/.config/nvim
    echo "║ ╠═Created nvim folder"
fi

if [ ! -f "$HOME/.gitconfig" ]; then
    ln -s $(pwd)/git/.gitconfig $HOME/.gitconfig
    echo "║ ╠═Created gitconfig link"
fi

if [ ! -f "$HOME/.vimrc" ]; then
    ln -s $(pwd)/vim/.vimrc $HOME/.vimrc
    echo "║ ╠═Created vimrc link"
fi

if [ ! -f "$HOME/.config/nvim/init.vim" ]; then
    ln -s $(pwd)/vim/.vimrc $HOME/.config/nvim/init.vim
    echo "║ ╠═Created init.vim link"
fi

echo "╠═╩═Symlinks finished"
