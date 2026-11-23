#!/bin/bash

fflag=	# Force
vflag=	# Verbose
while getopts fv opt; do
	case $opt in
		f) fflag=1 ;;
		v) vflag=1 ;;
		?) printf "Usage: %s: [-fv]\n" $0
	esac
done
shift $((OPTIND - 1))

askforce=

if [[ -n $vflag ]] ; then
	RM() { rm -v "$@" ; }
	LN() { ln -v "$@" ; }
	MKDIR() { mkdir -v "$@" ; }
else
	RM() { rm "$@" ; }
	LN() { ln "$@" ; }
	MKDIR() { mkdir "$@" ; }
fi

DF_WD="$HOME/dotfiles"
DH_TARGETS_DIR="$DF_WD/dollarhome"
DC_TARGETS_DIR="$DF_WD/dotconfig"
DH_LINKS_DIR="$HOME"
DC_LINKS_DIR=${XDG_CONFIG_HOME:-"$HOME/.config"}

for f in $(ls "$DH_TARGETS_DIR") ; do
	TARGET="$DH_TARGETS_DIR/$f"
	LINK_NAME="$DH_LINKS_DIR/.$f" # NB! Dot in front of $f
	if [[ -f "$LINK_NAME" || -L "$LINK_NAME" ]] ; then
		if [[ -z $fflag ]] ; then
			echo "Error: Dotfile already exists: .$f" >&2
			askforce=1
			continue
		else
			RM "$LINK_NAME"
		fi
	fi
	LN -s "$TARGET" "$LINK_NAME"
done

[[ ! -d $DC_LINKS_DIR ]] && MKDIR $DC_LINKS_DIR

for d in $(ls "$DC_TARGETS_DIR") ; do
	TARGET="$DC_TARGETS_DIR/$d"
	LINK_NAME="$DC_LINKS_DIR/$d"
	if [[ -d "$LINK_NAME" || -L "$LINK_NAME" ]] ; then
		if [[ -z $fflag ]] ; then
			echo "Error: Directory already exists: $d" >&2
			askforce=1
			continue
		else
			# Not gonna use -f flag as there shouldn't be any
			# protected files/directories
			RM -r "$LINK_NAME"
		fi
	fi
	LN -s "$TARGET" "$LINK_NAME"
done

[[ -n $askforce ]] && echo "Use -f flag to force overwrite" >&2
