#!/bin/bash 

#declare -a LAYOUTS

LAYOUTS=(tr us)

THIS_MODE=$(setxkbmap -print -verbose 10 | egrep -e layout | xargs | cut -d" " -f2)

switch_mode () {
	
	echo New Layout: ${1^^}
	setxkbmap -layout $1
	notify-send ${1^^}

}


if [ ${LAYOUTS[0]} = $THIS_MODE ]; then 
	NEXT_MODE=${LAYOUTS[1]}
else
	NEXT_MODE=${LAYOUTS[0]}
fi

switch_mode $NEXT_MODE

