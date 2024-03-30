ZSH_THEME="robbyrussell"

export ZSH="$HOME/.oh-my-zsh"
export GOPATH="$HOME/go"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

export PATH="$GOPATH/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
alias e64="cat | tr -d \"\\n\" | base64 -w 0"
alias d64="base64 -d"

. $HOME/dotfiles/zsh/custom.sh

plugins=(
    kubectl
    git
    dnf
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-fzf-history-search
)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. $HOME/.asdf/asdf.sh

source $ZSH/oh-my-zsh.sh

alias minikube-env='eval $(minikube docker-env)'
alias kg='kubectl get'
alias kgpo='kubectl get pods'
alias kgpoa='kubectl get pods --all-namespaces'
alias kgd='kubectl get deployments'
alias kl='kubectl logs -f'
alias ka='kubectl apply -f'
alias krmf='kubectl delete -f'
alias krm='kubectl delete'
alias kex='kubectl exec -it'
alias editvim="vim ~/dotfiles/vim/.vimrc"
alias editcustom="vim ~/dotfiles/zsh/custom.sh"
