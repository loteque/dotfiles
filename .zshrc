# Use powerline
USE_POWERLINE="true"
powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh
# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fish-like auto suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

#Global alias definitions
alias -g ll="ls -Alph --group-directories-first --sort=extension --color=auto"
alias -g code="vscodium"

## Alias definitions with params

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


# yazi
# provides the ability to change the current working directory when exiting Yazi
# press q to quit, you'll see the CWD changed. Sometimes, you don't want to change, press Q to quit.
function li() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
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