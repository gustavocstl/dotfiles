#!/bin/bash

. $(pwd)/vars

sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev

sudo apt -y install \
curl \
wget \
tmux \
zsh \
silversearcher-ag \
ffmpeg \
youtube-dl \
gnupg \
jq \
ranger \
libpq-dev \
python3-dev \
i3-wm \
i3 \
i3lock \
arandr \
feh

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit lazygit.tar.gz

. $(pwd)/zsh/setup.sh
. $(pwd)/asdf/setup.sh
. $(pwd)/git/setup.sh
. $(pwd)/installers/symlinks.sh
. $(pwd)/vscode/setup.sh