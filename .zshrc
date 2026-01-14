# zsh vars
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

# opts
setopt AUTO_PUSHD
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt SHARE_HISTORY
export KEYTIMEOUT=1
autoload -U compinit; compinit
bindkey -e

# do the cool ssh with clipboard capabilites thingy
___dt_term_socket_ssh() {
	ssh -oControlPath=$1 -O exit DUMMY_HOST
}

sshx() {
	local t=$(mktemp -u --tmpdir ssh.sock.XXXXXXXXXX)
	local f="~/clip"
	ssh -f -oControlMaster=yes -oControlPath=$t $@ tail\ -f\ /dev/null || return 1
	ssh -S$t DUMMY_HOST "bash -c 'if ! [ -p $f ]; then mkfifo $f; fi'" \
		|| { ___dt_term_socket_ssh $t; return 1; }
	(
	set -e
	set -o pipefail
	while [ 1 ]; do
		ssh -S$t -tt DUMMY_HOST "cat $f" 2>/dev/null | xclip -selection clipboard
	done &
	)
	ssh -S$t DUMMY_HOST \
		|| { ___dt_term_socket_ssh $t; return 1; }
	ssh -S$t DUMMY_HOST "command rm $f"
	___dt_term_socket_ssh $t
}

# Read mds
md() {
	pandoc "$1" | lynx -stdin
}


# Keep prompt at last line
___prompt_to_bottom() {
	tput cup $LINES
}

___clearx_to_bottom() {
	clear -x && ___prompt_to_bottom && zle reset-prompt
}

# Prompt
___update-psvar() {
	emulate -L zsh
	[[ -v commands[git] ]] &&
		psvar=("$(git branch --show-current 2> /dev/null) ") ||
			psvar=('')
}

zle -N ___clearx_to_bottom

autoload -Uz add-zsh-hook
add-zsh-hook precmd ___update-psvar

PROMPT=$'%F{cyan}%n@%m%f %F{white}%~ %(1V:%F{red}λ%F{white}:)%1v%F{magenta}>%f '

# source fzf
command -v fzf &> /dev/null && source <(fzf --zsh)

# do the cool directory thingy
alias ds='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# make stuff more colourful
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias less="less -R"
alias tree="tree -C"

alias clear="clear && ___prompt_to_bottom"
bindkey ^L ___clearx_to_bottom

# init stuff
___prompt_to_bottom

# Greeting
# alt check: `type figlet cowsay lolcat >/dev/null 2>&1'
hash figlet cowsay lolcat 2>/dev/null && figlet oh hi | cowsay -n | lolcat
