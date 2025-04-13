print ${(pl:$LINES::\n:):-}
PS1="\e[0;37m\w \l\e[1;35m > \e[0m"

set -o	vi
set -o	history
shopt	histappend
HISTSIZE=100000
HISTCONTROL=ignorespace:ignoredups:erasedups

aliaseses="$HOME/.aliases"
hbdir="$HOME/linbrew"
localstuff="$HOME/.localstuff"

[[ -f $aliaseses ]] && source $aliaseses
[[ -f $hbdir/bin/brew ]] && eval "$($hbdir/bin/brew shellenv)"
[[ -f $localstuff ]] && source $localstuff

alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias tree="tree -C"

md() { pandoc "$1" | lynx -stdin; }

hash figlet cowsay lolcat 2>/dev/null && figlet 'allo 42!' | cowsay -n | lolcat
