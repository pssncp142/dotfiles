#!/bin/sh

do_install(){
	
	# echo commands
	set -x

	home=/home/$1
	cp files/zshenv $home/.zshenv
	cp files/zshrc $home/.zshrc
	cp files/vimrc $home/.vimrc
	cp files/tmux.conf $home/.tmux.conf
	cp files/termite/config $home/.config/termite/config

	set +x
}

user=$1  # user to set configs

while true; do
	read -p "dotfiles will be installed for the user: $1. Existing files will be overwritten. Do you wish to continue? ([yY/nN])" yn
    case $yn in
        [Yy]* ) do_install $1; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done




