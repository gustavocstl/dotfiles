#!/bin/bash
cat << EOF | sudo tee $(pwd)/git/.gitconfig
[user]
    name = $GIT_USER
    email = $GIT_EMAIL
EOF
