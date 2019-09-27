#!/bin/bash

CHAR1='>'
CHAR2='<'

function backlight_get {
	xbacklight -get
}

function backlight_inc {
	xbacklight -set $(echo `backlight_get`+10 | bc)
	notify
	#level=`backlight_get`
	#bar="─"$(seq -s "a" $(($level/4)) | sed 's/[0-9]//g')
	#dunstify "$bar" -i cs-screen \
	#	-h string:synchronous:backlight -a backlight -u low -t 2000 -r 555
}

function backlight_dec {
	xbacklight -set $(echo `backlight_get`-10 | bc)
	notify
	#level=`backlight_get`
	#bar="─"$(seq -s "a" $(($level/4)) | sed 's/[0-9]//g')
	#dunstify "$bar" -i cs-screen \
	#	-h string:synchronous:backlight -a backlight -u low -t 2000 -r 555
}

function notify {

	level=`backlight_get`
	bar=$(seq -s $CHAR1 $(($level/5)) | sed 's/[0-9]//g')
	bar=$bar$(seq -s $CHAR2 $(((100-$level)/5)) | sed 's/[0-9]//g')
	dunstify "$bar" -i cs-screen \
		-h string:synchronous:backlight -a backlight -u low -t 2000 -r 555

}

case $1 in 
	get)
		backlight_get;;
	inc)
		backlight_inc;;
	dec)
		backlight_dec;;
esac


