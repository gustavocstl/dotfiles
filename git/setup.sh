#!/bin/bash
cat << EOF | sudo tee $(pwd)/git/.gitconfig
[user]
    name = $GIT_USER
    email = $GIT_EMAIL
[gpg "ssh"]
	allowedSignersFile = ~/.config/git/allowed-signers
[commit]
	gpgsign = true
[gpg]
	format = ssh
EOF
