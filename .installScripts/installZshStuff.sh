#!/bin/zsh

# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# powerover10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ] ; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# zsh-syntax-highlighter
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ] ; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# ProggyClean TTCC Nerd Font (get curl)
curl -fL https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/ProggyClean/Regular/complete/ProggyCleanTT%20Nerd%20Font%20Complete%20Mono.ttf -o $HOME/Downloads/ProggyCleanTT.ttf | font-manager -i

# GNU unifont
curl -fL http://unifoundry.com/pub/unifont/unifont-14.0.01/font-builds/unifont-14.0.01.ttf -o $HOME/Downloads/unifont.ttf | font-manager -i
