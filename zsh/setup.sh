#!/bin/bash

_log "ZSH Setup"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    _log "Oh My ZSH installed"
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
    _log "Syntax highlight installed"
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    _log "Autosuggestions installed"
fi

if [ ! -d "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
    _log "Fzf installed"
fi

if [ -f "$HOME/.zshrc" ]; then
    rm ~/.zshrc
fi

ln -s $(pwd)/zsh/.zshrc $HOME/.zshrc

_log "Created .zshrc link"

sudo chsh -s $(which zsh)

_log "ZSH Finished"
