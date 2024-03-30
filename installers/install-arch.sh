#!/bin/bash

. $(pwd)/vars

pacman -Qi yay >> /dev/null
if [ $? != 0 ]; then
    pacman -S --needed git base-devel && \
    git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si && \
    cd .. && \
    rm -rf yay
fi

sudo pacman -S --noconfirm --needed \
alacritty \
i3 \
i3lock \
i3-wm \
wget \
tmux \
zsh \
the_silver_searcher \
jq \
ranger \
arandr \
rofi \
lazygit \
thunar \
mupdf \
scrot \
seahorse \
pipewire \
pipewire-pulse \
pavucontrol \
archlinux-wallpaper \
feh \
zip \
unzip

yay -S --noconfirm --needed \
visual-studio-code-bin \
adwaita-icon-theme-git

# using cedilha. ref: https://gist.github.com/nilo/c2a31a0f9f29c88145ca
setxkbmap -layout us -variant intl
localectl set-x11-keymap us "" altgr-intl

sed 's/"cedilla" "Cedilla" "gtk20" "\/usr\/share\/locale" "az:ca:co:fr:gv:oc:pt:sq:tr:wa"/"cedilla" "Cedilla" "gtk20" "\/usr\/share\/locale" "az:ca:co:fr:gv:oc:pt:sq:tr:wa:en"/g' /usr/lib/gtk-3.0/3.0.0/immodules.cache > immodules.cache
sudo mv immodules.cache /usr/lib/gtk-3.0/3.0.0/immodules.cache

sudo cp /usr/share/X11/locale/en_US.UTF-8/Compose /usr/share/X11/locale/en_US.UTF-8/Compose.bak
sed 's/ć/ç/g' < /usr/share/X11/locale/en_US.UTF-8/Compose | sed 's/Ć/Ç/g' > Compose
sudo mv Compose /usr/share/X11/locale/en_US.UTF-8/Compose

cat /etc/environment | grep GTK_IM_MODULE
if [ $? != 0 ]; then
	sudo bash -c 'cat << EOF >> /etc/environment
	GTK_IM_MODULE=cedilla
	EOF'
fi

cat /etc/environment | grep QT_IM_MODULE
if [ $? != 0 ]; then
	sudo bash -c 'cat << EOF >> /etc/environment
	QT_IM_MODULE=cedilla
	EOF'
fi

. $(pwd)/zsh/setup.sh
. $(pwd)/asdf/setup.sh
. $(pwd)/git/setup.sh
. $(pwd)/installers/symlinks.sh
. $(pwd)/vscode/setup.sh