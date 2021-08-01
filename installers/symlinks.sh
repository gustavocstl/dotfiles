#!/bin/bash

_log "Symlinks setup"

if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
fi

if [ ! -d "$HOME/.config/ranger" ]; then
    mkdir $HOME/.config/ranger
fi

if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir $HOME/.config/nvim
    _log "Created nvim folder"
fi

if [ ! -f "$HOME/.gitconfig" ]; then
    ln -s $(pwd)/git/.gitconfig $HOME/.gitconfig
    _log "Created gitconfig link"
fi

if [ ! -f "$HOME/.vimrc" ]; then
    ln -s $(pwd)/vim/.vimrc $HOME/.vimrc
    _log "Created vimrc link"
fi

if [ ! -f "$HOME/.config/nvim/init.vim" ]; then
    ln -s $(pwd)/vim/.vimrc $HOME/.config/nvim/init.vim
    _log "Created init.vim link"
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
    ln -s $(pwd)/tmux/.tmux.conf $HOME/.tmux.conf
    _log "Created tmux.conf link"
fi

if [ "$(uname -s)" = "Darwin" ]; then
    if [ ! -d "/Library/Java/JavaVirtualMachines/openjdk.jdk" ]; then
	sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
	_log "Created openjdk link"
    fi
fi

if [ ! -f "$HOME/.config/ranger/rc.conf" ]; then
    ln -s $(pwd)/ranger/rc.conf $HOME/.config/ranger/rc.conf
    _log "Created ranger config link"
fi

_log "Symlinks finished"
