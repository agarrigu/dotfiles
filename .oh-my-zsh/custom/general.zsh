# Dotfiles git aliases 
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias df="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dfa="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add"
alias dfau="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add --update"
alias dfcmsg="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m"
alias dfp="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push"
alias dfl="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull"

# Aesthetic aliases
alias asciiquarium= perl /usr/local/bin/asciiquarium
alias random-figlet="figlet -f $(ls $(figlet -I2)/*.flf | shuf -n1)"
alias random-cowsay="cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)"

# Config aliases
alias .cn="$HOME/.config/nvim/"
