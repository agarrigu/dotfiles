#!/bin/bash

declare -ar DH_FILES=(
".aliases"
".gdbinit"
".gitconfig	"
".tmux.conf"	
".vimrc	"
".zsh_prompt	"
".zshenv	"
".zshrc	"
)

declare -ar DH_DIRS=(	
".vim"	
".config/nvim"	
)

for f in ${DH_FILES[@]}; do
	[[ -f "$HOME/dotfiles/$f" ]] && [[ ! -f $HOME/$f ]] \
	&& ln -s "$HOME/dotfiles/$f" "$HOME/$f"
done

for d in ${DH_DIRS[@]}; do
	[[ -d "$HOME/dotfiles/$d" ]] && [[ ! -d "$HOME/$d" ]] \
	&& ln -s "$HOME/dotfiles/$d" "$HOME/$d"
done

