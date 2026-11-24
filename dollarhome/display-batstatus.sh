#!/bin/sh

PS_DIR=/sys/class/power_supply
[ ! -d $PS_DIR  ] && echo "NO POWER INFO" && exit

ON_FILE=$PS_DIR/AC/online
{ [ -f $ON_FILE ] && BAT_INFO="AC:$(cat $ON_FILE)"; } || BAT_INFO='NO AC'

BAT_DIRS="$(ls -dx $PS_DIR/BAT* 2>/dev/null)"
[ -z "$BAT_DIRS" ] && exit	# If we have AC but no BAT0 we are probably not a laptop.

for d in $BAT_DIRS ; do
	CAP_FILE="$d/capacity"
	{ [ -f "$CAP_FILE" ] && CAP="$(cat $CAP_FILE)"; } || CAP='ERR'
	BAT_INFO="$BAT_INFO|$(basename $d):$CAP%"
done

echo $BAT_INFO
