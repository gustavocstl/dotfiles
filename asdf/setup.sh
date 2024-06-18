#!/bin/bash
if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
fi

if [ ! -d "$HOME/.asdf/installs/nodejs" ]; then
    asdf plugin add nodejs && \
    asdf install nodejs 20.14.0 && \
    asdf global nodejs 20.14.0 && \
    npm i -g eslint vscode-langservers-extracted typescript typescript-language-server prettier @johnnymorganz/stylua-bin
fi

if [ ! -d "$HOME/.asdf/installs/python" ]; then
    asdf plugin add python && \
    asdf install python 3.12.4 && \
    asdf global python 3.12.4 && \
    asdf reshim && \
    pip install black psycopg2-binary pyright debugpy mdformat mdformat-tables
fi

if [ ! -d "$HOME/.asdf/installs/golang" ]; then
    asdf plugin-add golang https://github.com/kennyp/asdf-golang.git && \
    asdf install golang 1.22.4 && \
    asdf global golang 1.22.4 && \
    asdf reshim && \
    go install golang.org/x/tools/gopls@latest && \
    go install golang.org/x/tools/cmd/goimports@latest && \
    go install github.com/go-delve/delve/cmd/dlv@latest
fi

asdf reshim
