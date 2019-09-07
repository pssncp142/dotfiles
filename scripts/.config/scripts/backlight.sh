#!/bin/bash

function backlight_get {
	xbacklight -get
}

function backlight_inc {
	xbacklight -set $(echo `backlight_get`+4 | bc)
	level=`backlight_get`
	bar="─"$(seq -s "─" $(($level/4)) | sed 's/[0-9]//g')
	#dunstify "$bar" -i cs-screen \
	#	-h string:synchronous:backlight -a backlight -u low -t 2000 -r 555
}

function backlight_dec {
	xbacklight -set $(echo `backlight_get`-4 | bc)
	level=`backlight_get`
	bar="─"$(seq -s "─" $(($level/4)) | sed 's/[0-9]//g')
	#dunstify "$bar" -i cs-screen \
	#	-h string:synchronous:backlight -a backlight -u low -t 2000 -r 555
}

#echo $(echo `backlight_get`+5 | bc)

case $1 in 
	get)
		backlight_get;;
	inc)
		backlight_inc;;
	dec)
		backlight_dec;;
esac


