#!/bin/bash
echo "╠═╦═Git setup"
cat << EOF > $(pwd)/git/.gitconfig
[user]
    name = $GIT_USER
    email = $GIT_EMAIL
EOF
echo "║ ╠═User: $GIT_USER"
echo "║ ╠═Email: $GIT_EMAIL"
echo "║ ╠═Config file created in $(pwd)/git/.gitconfig"
echo "╠═╩═Git finished"
