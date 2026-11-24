#!/bin/sh

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

if [ -n "$vflag" ]; then
	RM() { rm -v "$@"; }
	LN() { ln -v "$@"; }
	MKDIR() { mkdir -v "$@"; }
else
	RM() { rm "$@"; }
	LN() { ln "$@"; }
	MKDIR() { mkdir "$@"; }
fi

WORKDIR="${DOTFILES_WD:-$HOME/dotfiles}"
DF_TARGETS_DIR="$WORKDIR/dollarhome"
CH_TARGETS_DIR="$WORKDIR/dotconfig"
DF_LINKS_DIR="$HOME"
CH_LINKS_DIR=${XDG_CONFIG_HOME:-"$HOME/.config"}

for f in $(ls "$DF_TARGETS_DIR") ; do
	TARGET="$DF_TARGETS_DIR/$f"
	LINK_NAME="$DF_LINKS_DIR/.$f" # NB! Dot in front of $f
	if [ -f "$LINK_NAME" || -L "$LINK_NAME" ] ; then
		if [ -z "$fflag" ] ; then
			echo "Error: Dotfile already exists: .$f" >&2
			askforce=1
			continue
		else
			RM "$LINK_NAME"
		fi
	fi
	LN -s "$TARGET" "$LINK_NAME"
done

for TARGET in $(find "$CH_TARGETS_DIR" -type f -print); do
	RPART="${TARGET##$CH_TARGETS_DIR/}" # NB! Trailing forward-slash
	LINK_NAME="$CH_LINKS_DIR/$RPART"
	if [ -f "$LINK_NAME" ] || [ -L "$LINK_NAME" ]; then
		if [ -z "$fflag" ]; then
			echo "Error: File already exists: $LINK_NAME" >&2
			askforce=1
			continue
		else
			RM "$LINK_NAME"
		fi
	fi
	MKDIR -p $(dirname "$LINK_NAME")
	LN -s "$TARGET" "$LINK_NAME"
done

[ -n $askforce ] && echo 'Use -f flag to force overwrite' >&2
