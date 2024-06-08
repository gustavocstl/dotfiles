#!/bin/bash

if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
fi

if [ ! -d "$HOME/.config/ranger" ]; then
    mkdir $HOME/.config/ranger
fi

if [ ! -f "$HOME/.gitconfig" ]; then
    ln -s $(pwd)/git/.gitconfig $HOME/.gitconfig
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
    ln -s $(pwd)/tmux/.tmux.conf $HOME/.tmux.conf
fi

if [ ! -f "$HOME/.config/alacritty/alacritty.toml" ]; then
    mkdir -p $HOME/.config/alacritty
    ln -s $(pwd)/alacritty/config.toml $HOME/.config/alacritty/alacritty.toml
fi

if [ ! -f "$HOME/.config/i3/config" ]; then
    mkdir -p $HOME/.config/i3
    ln -s $(pwd)/i3/config $HOME/.config/i3/config
fi

if [ ! -f "$HOME/.config/i3status/config" ]; then
    mkdir -p $HOME/.config/i3status
    ln -s $(pwd)/i3/bar-config $HOME/.config/i3status/config
fi

if [ ! -f "$HOME/.screenlayout/default.sh" ]; then
    mkdir -p $HOME/.screenlayout
    ln -s $(pwd)/i3/screenlayout.sh $HOME/.screenlayout/default.sh
fi

if [ ! -f "$HOME/.config/ranger/rc.conf" ]; then
    ln -s $(pwd)/ranger/rc.conf $HOME/.config/ranger/rc.conf
fi

if [ ! -f "$HOME/.vimrc" ]; then
    ln -s $(pwd)/vim/.vimrc $HOME/.vimrc
fi

if [ ! -f "$HOME/.config/nvim/init.lua" ]; then
	ln -s $(pwd)/vim $HOME/.config/nvim
fi

if [ ! -f "$HOME/.Xresources" ]; then
    ln -s $(pwd)/x11/.Xresources $HOME/.Xresources
fi

if [ ! -f "$HOME/.xinitrc" ]; then
    ln -s $(pwd)/x11/.xinitrc $HOME/.xinitrc
    sudo chmod 755 $HOME/.xinitrc
fi

if [ ! -f "$HOME/.config/i3status/custom_i3status.sh" ]; then
    mkdir -p $HOME/.config/i3status
    ln -s $(pwd)/i3/custom_i3status.sh $HOME/.config/i3status/custom_i3status.sh
fi

rm $HOME/.config/Code/User/settings.json
ln -s $(pwd)/vscode/settings.json $HOME/.config/Code/User/settings.json
