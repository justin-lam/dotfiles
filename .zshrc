[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.fzf-git ] && source ~/.fzf-git

# ls colors 
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# key bindings
bindkey -M vicmd "^V" edit-command-line #vi mode

# aliases
[ -f ~/.aliases ] && source ~/.aliases

# bash-my-aws
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

for f in ~/.bash-my-aws/lib/*-functions; do source $f; done
source ~/.bash-my-aws/bash_completion.sh

# zplugs 
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# plugins from oh-my-zsh
zplug "lib/completion", from:oh-my-zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/node", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh

# pure prompt
zplug "mafredri/zsh-async", from:github 
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug "urbainvaes/fzf-marks"
zplug "zdharma/fast-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug "zsh-users/zsh-completions"

# Then, source plugins and add commands to $PATH
zplug load 


