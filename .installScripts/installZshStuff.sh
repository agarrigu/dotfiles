#!/bin/zsh

# oh-my-zsh
if [ ! -d "../.oh-my-zsh" ] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# powerover10k
if [ ! -d "${ZSH_CUSTOM:-../.oh-my-zsh/custom}/themes/powerlevel10k" ] ; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-../.oh-my-zsh/custom}/themes/powerlevel10k
fi

# zsh-syntax-highlighter
if [ ! -d "${ZSH_CUSTOM:-../.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ] ; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-../oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
