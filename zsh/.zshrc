ZSH_THEME="robbyrussell"

export ZSH="$HOME/.oh-my-zsh"
export GOPATH="$HOME/go"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

export PATH="$GOPATH/bin:$PATH"

if [[ "$(uname -s)" == "Darwin" ]]; then
    . $HOME/dotfiles/zsh/zshrc-darwin.sh
else
    . $HOME/dotfiles/zsh/zshrc-linux.sh
fi

. $HOME/dotfiles/zsh/custom.sh

plugins=(
    kubectl
    git
    dnf
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. $HOME/.asdf/asdf.sh

alias minikube-env='eval $(minikube docker-env)'
alias kg='kubectl get'
alias kgpo='kubectl get pods'
alias kgd='kubectl get deployments'
alias kl='kubectl logs -f'
alias ka='kubectl apply -f'
alias krmf='kubectl delete -f'
alias krm='kubectl delete'
alias kex='kubectl exec -it'
alias editvim="nvim ~/dotfiles/vim/.vimrc"
alias editcustom="nvim ~/dotfiles/zsh/custom.sh"
alias e64="cat | tr -d \"\\n\" | base64 -w 0"
alias d64="base64 -d"
