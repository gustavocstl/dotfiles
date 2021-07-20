#!/bin/bash
echo "╠═╦═Symlinks setup"

if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
fi

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

if [ ! -f "$HOME/.tmux.conf" ]; then
    ln -s $(pwd)/tmux/.tmux.conf $HOME/.tmux.conf
    echo "║ ╠═Created tmux.conf link"
fi

if [ ! -d "/Library/Java/JavaVirtualMachines/openjdk.jdk" ]; then
    sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
    echo "║ ╠═Created openjdk link"
fi

if [ ! -f "$HOME/.config/ranger/rc.conf" ]; then
    ln -s $(pwd)/ranger/rc.conf $HOME/.config/ranger/rc.conf
    echo "║ ╠═Created ranger config link"
fi

echo "╠═╩═Symlinks finished"
