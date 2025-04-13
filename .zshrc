# Keep prompt at bottom
print ${(pl:$LINES::\n:):-}

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

alias ds='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

bindkey -v
export KEYTIMEOUT=1

# edit commands in the best text-editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source "$HOME/.aliases"
source "$HOME/.zsh_prompt"

# Read mds
md() { pandoc "$1" | lynx -stdin; }

# Greeting
# alt check: `type figlet cowsay lolcat >/dev/null 2>&1'
hash figlet cowsay lolcat 2>/dev/null && figlet oh hi | cowsay -n | lolcat

autoload -U compinit; compinit
if [ -d "/usr/share/zsh-syntax-highlighting" ] ; then
	source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
