#!/bin/bash

# Global Vars
essentials="$(<packages-essential.txt)"
fancy="$(<packages-fancy.txt)"
nvimdeps="$(<packages-nvim-depends.txt)"

# TODO: FIX FIX FIX, argument parser, maybe get neovim release?
main () {
    determine_package_manager
    install_essential
    install_fancy
    install_neovim
}

#use this function for the individualstuff
install_from_txt() {
    a=("$@")
    for app in ${a[@]}; do
        if ${install} $app ; then
            echo "Installed package succesfully: ($app)" >> install-script.log
        else
            echo -e "\033[0;31m Could not install $app \033[0m"
            sleep .6
            echo "Error: package not installed: ($app)" >> install-script.log
        fi
    done
}

install_fancy() {
    install_from_txt ${fancy[@]}
}

install_essential() {
    install_from_txt ${essentials[@]}
}


install_neovim() {
    # TODO: install LATEST neovim
    #
    install_from_txt ${nvimdeps[@]}

    # Set up Packer
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}

determine_package_manager() {
    if [ -x "$(command -v apt-get)" ]; then
        apt-get -y update && apt-get -y upgrade
        install="apt-get install -y"
        echo "Using apt-get to install packages"
    elif [ -x "$(command -v yum)" ]; then
        yum -y update
        install="yum install -y"
        echo "Using Yellow Dog Updater, Modified to install packages"
    elif [ -x "$(command -v dnf)" ]; then
        dnf -y update
        install="dnf install -y"
        echo "Using Dandified YUM to install packages"
    elif [ "$(command -v pacman)" ]; then
        pacman -Syu
        install="pacman -Syu --noconfirm"
        echo "Using pacman to install packages"
    elif [ "$(command -v zypper)" ]; then
        zypper update
        install="zypper install -y"
        echo "Using zypper to install packages"
    else
        echo "Error: Executable package manager not found, update the script or install one of the available managers: apt, yum, dnf, pacman, zypper"
        exit $ERRCODE
    fi
    sleep .6
}

main
