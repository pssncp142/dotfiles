#!/bin/bash 
# Toggles the xkb layout of the current X session. Set the values in LAYOUTS.

LAYOUTS=(tr us)

NLAYOUTS=${#LAYOUTS[@]}

_current_mode () {
	CURRENT_MODE=`setxkbmap -print -verbose 10 | egrep -e layout | xargs | cut -d" " -f2`
}

_next_mode () {
	_current_mode

	for i in $(seq 0 $NLAYOUTS); do
		if [ ${LAYOUTS[$i]} = $CURRENT_MODE ]; then break; fi
	done

	CTR=$i

	if [ $CTR = $(($NLAYOUTS-1)) ]; then 
		NEXT_MODE="${LAYOUTS[0]}"
	else
		CTR=$(($CTR+1))
		NEXT_MODE="${LAYOUTS[$CTR]}"
	fi

	echo $NEXT_MODE
}

_switch () {
	setxkbmap -layout $1
	polybar-msg hook xkb-layout 2
}

_status () {
	echo ${1^^}
}

_notify () {
	notify-send "Layout : ${1^^}"
	echo "Layout : ${1^^}"
}

_polybar () {
	while true; do
		sleep 1
		polybar-msg hook xkb-layout 2
	done
}

case $1 in
	--toggle)
		_next_mode 
		_switch $NEXT_MODE
		_current_mode
		_notify $CURRENT_MODE;;
	--status)
		_current_mode
		_status $CURRENT_MODE;;
	--notify)
		_current_mode
		_notify $CURRENT_MODE;;
	--polybar)
		_polybar;;
esac


