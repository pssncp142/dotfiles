EDITOR=nvim
#source $ZDOTDIR/.zshrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	sudo /usr/bin/prime-switch > /dev/null
	startx &> /dev/null
fi


