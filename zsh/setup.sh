#!/bin/bash
echo "╠═╦═ZSH setup"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh
    echo "║ ╠═Oh My ZSH installed"
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
    echo "║ ╠═Syntax highlight installed"
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    echo "║ ╠═Autosuggestions installed"
fi

if [ ! -d "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
    echo "║ ╠═Fzf installed"
fi

if [ -f "$HOME/.zshrc" ]; then
    rm ~/.zshrc
fi
ln -s $(pwd)/zsh/.zshrc $HOME/.zshrc
echo "║ ╠═Created .zshrc link"


echo "╠═╩═ZSH finished"
