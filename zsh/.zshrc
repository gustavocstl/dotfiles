ZSH_THEME="robbyrussell"

export ZSH="$HOME/.oh-my-zsh"
export GOPATH="$HOME/go"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_HOME=$(/usr/libexec/java_home)

export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk"

export PATH="$GOPATH/bin:$HOME/.local/bin:/usr/local/sbin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH" 
export PATH="/usr/local/opt/openjdk/bin:$PATH"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

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

alias java8='export JAVA_HOME=$JAVA_8_HOME'
