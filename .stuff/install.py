#!/usr/bin/python3
from argparse import ArgumentParser
from argparse import RawTextHelpFormatter
import subprocess

def setup_arguments():
    parser = ArgumentParser(
            description=(
                'An install script for alonso garr munoz\'s development enviroment'),
            formatter_class=RawTextHelpFormatter
    )

    parser.add_argument(
            '-a', '--all',
            dest='all',
            default=False,
            action='store_true',
            help='Same as -efnsz: Install everything installable and set up SSH'
            )

    parser.add_argument(
            '-e', '--essentials',
            dest='essentials',
            default=False,
            action='store_true',
            help='Install packages referred to in essentialPackages.txt: set up devenv except neovim'
            )

    parser.add_argument(
            '-f', '--fancy',
            dest='fancy',
            default=False,
            action='store_true',
            help='Install packages referred to in fancyPackages.txt: make things prettier'
            )

    parser.add_argument(
            '-n', '--neovim',
            dest='neovim',
            default=False,
            action='store_true',
            help='Install neovim and minor dependecies'
            )

    parser.add_argument(
            '-s', '--ssh',
            dest='ssh',
            default=False,
            action='store_true',
            help='Create SSH key and add it to agent'
            )

    parser.add_argument(
            '-w', '--webdev',
            dest='web_dev',
            default=False,
            action='store_true',
            help='Install web dev tools'
        )

    parser.add_argument(
            '-z', '--zshstuff',
            dest='zsh_stuff',
            default=False,
            action='store_true',
            help='Install zsh stuff (oh-my-zsh, p10k, etc.)'
        )

    args = parser.parse_args()

    if args.all:
        args.essentials = True
        args.fancy = True
        args.neovim = True
        args.ssh = True
        args.web_dev = True
        args.zsh_stuff = True

    return args

def run_install_scripts(args):
    if args.essentials:
        subprocess.call("installEssentials.sh")
    if args.fancy:
        subprocess.call("installFancy.sh")
    if args.neovim:
        subprocess.call("installNeoVim.sh")
    if args.zsh_stuff:
        subprocess.call("installZshStuff.sh")
    if args.web_dev:
        subprocess.call("installWebDevStuff.sh")
    if args.ssh:
        subprocess.call("setUpSSH.sh")

def main():
    args = setup_arguments()
    run_install_scripts(args)

if __name__ == '__main__':
    main()
