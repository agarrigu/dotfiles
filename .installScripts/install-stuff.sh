#!/bin/bash

# Global Vars
essetials="packages-essential.txt"
fancy="packages-fancy.txt"
webdev="packages-webdev.txt"

# TODO: argument parser, maybe get neovim release?
main () {
    determine_package_manager
    install_essential
    # install_fancy
    # install_webdeb
    # install_neovim
    # install_zshstuff
}

install_fancy() {
    $install $(cat packages-fancy.txt)
    font-manager -i "../NerdedFonts/*.tff"
}

install_essential() {
    $install $(cat packages-essential.txt)
}

install_webdeb() {
    # Bit short sighteD
    # TODO: npm installer function and .txt
    npm install -g browser-sync
}

install_zshstuff() {
    # This is a bit barbaric, I need to remove the custom files so all these
    # things can install, then need to re-pull
    rm -rf ../.oh-my-zsh

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

    # There's gotta be a better way!
    yadm pull
}

install_neovim() {
    $install $(cat packages-nvim-depends.txt)

    # TODO: install LATEST neovim

    # nvim dependecies, I think. It makes :checkhealth make more green checks.
    python -m install --user --ugrade pynvim
    npm install -g neovim
}

determine_package_manager() {
    if [ -x "$(command -v apt-get)"]; then
        apt-get -y update && apt-get -y upgrade
        install="apt-get install -y"
    elif [ -x "$(command -v yum)"]; then
        install="yum install -y"
    elif [ -x "$(command -v dnf)"]; then
        install="dnf install -y"
    elif [ "$(command -v pacman)"]; then
        pacman -Syu
        install="pacman -Sy"
    else
        echo "Error: Executable package manager not found, update the script or install one of the available managers: apt, yum, dnf, pacman"
        exit $ERRCODE
    fi
}

main
