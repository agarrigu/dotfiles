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

# Web Dev aliases
alias serve="browser-sync start --server --files ."
