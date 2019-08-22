#!/bin/sh -f

echo $USER

ans=`echo -e "Shutdown\nReboot\nHibernate\nSuspend\nLogout" | rofi -theme test -dmenu -p "Select action to perform ($USER)" -width -45 -lines 5`

case $ans in
	"Shutdown") systemctl poweroff
		;;
	"Reboot") systemctl reboot
		;;
	"Hibernate") systemctl hibernate
		;;
	"Suspend") systemctl suspend
		;;
	"Logout") loginctl terminate-user $USER
		;;
esac

