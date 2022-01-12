#!/usr/bin/python3
import argparse
from argparse import RawTextHelpFormatter
import subprocess

def setup_arguments():
    parser = argparse.ArgumentParser(
            description=(
                'An install script for alonso garr munoz\'s development enviroment'),
            formatter_class=argparse.RawTextHelpFormatter
    )

    parser.add_argument(
            '-a', '--all',
            dest='all',
            default=False,
            action='store_true',
            help='Install everything installable'
            )

    parser.add_argument(
            '-e', '--essentials',
            dest='essentials',
            default=False,
            action='store_true',
            help='Install packages referred to in essentialPackages.txt: set up devenv'
            )

    parser.add_argument(
            '-f', '--fancy',
            dest='fancy',
            default=False,
            action='store_true',
            help='Install packages referred to in fancyPackages.txt: make things prettier'
            )

    parser.add_argument(
            '-s', '--ssh',
            dest='ssh',
            default=False,
            action='store_true',
            help='Create SSH key and add it to agent'
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
        args.ssh = True
        args.zsh_stuff = True

    return args

def run_install_scripts(args):
    if args.essentials:
        subprocess.run(['source', '$HOME/.installScripts/installEssentials.sh'])
    if args.fancy:
        subprocess.run(['source', '$HOME/.installScripts/installFancy.sh'])
    if args.zsh_stuff:
        subprocess.run(['source', '$HOME/.installScripts/installZshStuff.sh'])
    if args.ssh:
        subprocess.run(['source', '$HOME/.installScripts/setUpSSH.sh'])

def main():
    args = setup_arguments()
    run_install_scripts(args)

if __name__ == '__main__':
    main()