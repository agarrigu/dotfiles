#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

aliases=.aliases
localstuff=.localrc

set -o history
shopt -qs histappend
HISTSIZE=100000
HISTCONTROL=ignorespace:ignoredups:erasedups

[[ -f $aliaseses ]]	&& source $aliaseses
[[ -f $localstuff ]]	&& source $localstuff

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tree="tree -C"
alias du='du -h'

# print ${(pl:$LINES::\n:):-}
PS1='\e[0;32m[\u@\h \w]\e[0m\$ '

alias cat="bat -pp"

source /usr/share/bash-completion/bash_completion

md() { pandoc "$1" | lynx -stdin; }

hash figlet cowsay lolcat 2>/dev/null && figlet 'Oh Hi!' | cowsay -n | lolcat
