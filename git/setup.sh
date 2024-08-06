#!/bin/bash

if [ ! -f "$HOME/.gitconfig" ]; then
cat << EOF | sudo tee $(pwd)/git/.gitconfig
[user]
    name = $GIT_USER
    email = $GIT_EMAIL
    signingkey = ~/.ssh/key
[gpg "ssh"]
    allowedSignersFile = ~/.config/git/allowed-signers
[commit]
    gpgsign = true
[gpg]
    format = ssh
EOF
fi
