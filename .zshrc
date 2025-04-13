# Keep prompt at bottom, mostly.
print ${(pl:$LINES::\n:):-}

# TODO: do something with this [[ -v HOMEBREW_PREFIX ]]

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
autoload -U compinit; compinit

# usr path vars
aliaseses="$HOME/.aliases"
promt="$HOME/.zsh_prompt"
hbdir="$HOME/linbrew"
fzfkb="/usr/share/doc/fzf/examples/key-bindings.zsh"
fzfcmp="/usr/share/doc/fzf/examples/completion.zsh"
zshsh="/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
brew_zshsh="$hbdir/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
localstuff="$HOME/.localstuff"

# sources and evals
[[ -f $aliaseses ]] && source $aliaseses
[[ -f $promt ]] && source $promt
[[ -f $fzfkb ]] && source $fzfkb
[[ -f $fzfcmp ]] && source $fzfcmp
[[ -f $localstuff ]] && source $localstuff
[[ -f $hbdir/bin/brew ]] && eval "$($hbdir/bin/brew shellenv)"

if [[ -f $zshsh ]]; then source $zshsh
elif [[ -f $brew_zshsh ]]; then;source $brew_zshsh
fi

# do the cool directory thing
alias ds='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# make stuff more colorfull
alias grep="grep --color=auto"
alias ls="ls --color=auto"

# Read mds
md() { pandoc "$1" | lynx -stdin; }

# Greeting
# alt check: `type figlet cowsay lolcat >/dev/null 2>&1'
hash figlet cowsay lolcat 2>/dev/null && figlet oh hi | cowsay -n | lolcat
