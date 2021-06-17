#!/bin/bash
echo "╠═╦═Asdf setup"

if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
    echo "║ ╠═Asdf installed"
fi

if [ ! -d "$HOME/.asdf/installs/nodejs" ]; then
    asdf plugin add nodejs && \
    asdf install nodejs 16.3.0 && \
    asdf global nodejs 16.3.0
    echo "║ ╠═Nodejs plugin added"
fi

if [ ! -d "$HOME/.asdf/installs/python" ]; then
    asdf plugin add python && \
    asdf install python 3.9.1 && \
    asdf global python 3.9.1
    echo "║ ╠═Python plugin added"
fi

if [ ! -d "$HOME/.asdf/installs/golang" ]; then
    asdf plugin-add golang https://github.com/kennyp/asdf-golang.git && \
    asdf install golang 1.16.5 && \
    asdf global golang 1.16.5
    echo "║ ╠═Golang plugin added"
fi

asdf reshim

echo "╠═╩═Asdf finished"
