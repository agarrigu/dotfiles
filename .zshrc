# source local/private configs before anything else
localstuff="$HOME/.localrc"
[[ -f $localstuff ]] && source $localstuff

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

___prompt_to_bottom() {
	tput cup $LINES
}

# do the cool ssh with clipboard capabilites thingy
_dt_term_socket_ssh() {
	ssh -oControlPath=$1 -O exit DUMMY_HOST
}

function sshx {
	local t=$(mktemp -u --tmpdir ssh.sock.XXXXXXXXXX)
	local f="~/clip"
	ssh -f -oControlMaster=yes -oControlPath=$t $@ tail\ -f\ /dev/null || return 1
	ssh -S$t DUMMY_HOST "bash -c 'if ! [ -p $f ]; then mkfifo $f; fi'" \
		|| { _dt_term_socket_ssh $t; return 1; }
	(
	set -e
	set -o pipefail
	while [ 1 ]; do
		ssh -S$t -tt DUMMY_HOST "cat $f" 2>/dev/null | xclip -selection clipboard
	done &
	)
	ssh -S$t DUMMY_HOST \
		|| { _dt_term_socket_ssh $t; return 1; }
	ssh -S$t DUMMY_HOST "command rm $f"
	_dt_term_socket_ssh $t
}

# Read mds
md() { pandoc "$1" | lynx -stdin; }

# usr path vars
aliaseses="$HOME/.aliases"
promt="$HOME/.zsh_prompt"
fzfkb="/usr/share/doc/fzf/examples/key-bindings.zsh"
fzfcmp="/usr/share/doc/fzf/examples/completion.zsh"
zshsh="/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# sources and evals
[[ -f $aliaseses ]] && source $aliaseses
[[ -f $promt ]] && source $promt
[[ -f $fzfkb ]] && source $fzfkb
[[ -f $fzfcmp ]] && source $fzfcmp
[[ -f $zshsh ]] && source $zshsh

# do the cool directory thingy
alias ds='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# make stuff more colorfull
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias less="less -R"
alias tree="tree -C"

alias clear="clear && ___prompt_to_bottom"

# init stuff
___prompt_to_bottom

# Greeting
# alt check: `type figlet cowsay lolcat >/dev/null 2>&1'
hash figlet cowsay lolcat 2>/dev/null && figlet oh hi | cowsay -n | lolcat
