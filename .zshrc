# Keep prompt at bottom, mostly.
print ${(pl:$LINES::\n:):-}

# usr path vars
ALIASESFILE="$HOME/.aliases"
PROMTFILE="$HOME/.zsh_prompt"
HOMEBREWDIR="$HOME/linbrew"

# zsh vars
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

# opts
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
bindkey -v
export KEYTIMEOUT=1

# sources and evals
ls $ALIASESFILE &>/dev/null && source $ALIASESFILE
ls $PROMTFILE &>/dev/null && source $PROMTFILE
ls $HOMEBREWDIR &>/dev/null && eval "$($HOMEBREWDIR/bin/brew shellenv)"

# do the cool directory thing
alias ds='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Read mds
md() { pandoc "$1" | lynx -stdin; }

# Greeting
# alt check: `type figlet cowsay lolcat >/dev/null 2>&1'
hash figlet cowsay lolcat 2>/dev/null && figlet oh hi | cowsay -n | lolcat

autoload -U compinit; compinit
if [ -d "/usr/share/zsh-syntax-highlighting" ] ; then
	source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
