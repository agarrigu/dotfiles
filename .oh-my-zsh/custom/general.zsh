# Dotfiles git aliases 
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dof="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dfa="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add"
alias dfau="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add --update"
alias dfcmsg="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m"
alias dfp="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push"
alias dfl="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull"

# Aesthetic aliases
alias asciiquarium= perl /usr/local/bin/asciiquarium
alias random-figlet="figlet -f $(ls $(figlet -I2)/*.flf | shuf -n1)"
alias random-cowsay="cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)"

# Copypasta
alias copy="xclip -selection c"
alias pasta="xclip -selection c -o"

#xfce4files git aliases
alias xfce4files="/usr/bin/git --git-dir=$HOME/.xfce4files/ --work-tree=$HOME"
alias x4f="/usr/bin/git --git-dir=$HOME/.xfce4files/ --work-tree=$HOME"
