# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

#Global alias definitions
alias -g ll="ls -Alph --group-directories-first --sort=extension --color=auto"
alias -g code="vscodium"

# Alias definitions with params

# grep $2 inside manpages of $1
mans() {
  man $1 | grep -- $2
}

# grep $2 from ll of $1
lg() {
  
  list_and_grep_pretty(){
    if [ $# -eq 1 ]
    then
      ll . | grep -- $1
    else
      ll $1 | grep -- $2
    fi
  }  
  
  list_and_grep_pretty $1 $2

}

# default extension handlers
# system
alias -s zshrc="code"
alias -s txt="code"
# rust
alias -s toml="code"
alias -s rs="code"
# godot
alias -s gd="code"
alias -s tscn="code"
alias -s tres="code"