#!/bin/bash
# Toggle xfce4 presentation mode and notify-send the status

_toggle() {
	xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -T
}

_status() {
	STATUS=`xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode`
	if [ $STATUS = "true" ]; then STATUS="ON"; else STATUS="OFF"; fi

	MESSAGE="Presentation Mode : "$STATUS
}

case $1 in 
	--status)
		_status
		echo ${STATUS};;
	--toggle)
		_toggle
		_status
		notify-send "${MESSAGE}";;
esac

