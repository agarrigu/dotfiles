#!/bin/sh

dollarhome="
.aliases
.gitconfig
.tmux.conf
.vim
.vimrc
.zsh_prompt
.zshenv
.zshrc
"

dotconfig="
nvim
"

for file in $dollarhome; do
	[[ -f "$HOME/dotfiles/$file" ]] && [[ ! -f $HOME/$file ]] \
	&& ln -s "$HOME/dotfiles/$file" "$HOME/$file"
done

for dir in $dotconfig; do
	[[ -d "$HOME/dotfiles/$dir" ]] && [[ ! -d "$HOME/.config/$dir" ]] \
	&& ln -s "$HOME/dotfiles/$dir" "$HOME/.config/$dir"
done

