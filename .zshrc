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
mans() {
  man $1 | grep -- $2
}

cdl() {
  DIR="$*";
  if [ $# -lt 1 ]
  then
    DIR=$HOME
  fi;
  builtin cd "${DIR}" && \
    ll
}

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

lo() {
  
  list_and_grep(){
    lg $1 $2
  }
  
  grep_open(){
    if [ $# -eq 1 ]
    then
      eval $(ls | grep -- $1)
    else
      cd $1 && \
      eval $(ls | grep -- $2)
      cd - >/dev/null
    fi
  }

  list_and_grep $1 $2
  grep_open $1 $2

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