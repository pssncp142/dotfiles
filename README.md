# dotfiles

My dotfiles for:
- i3wm
- polybar
- zsh
- neovim
- rofi
- termite

You are welcome to use them as you want.

I also added a Makefile to simplify the delivery

```

# Install a selected package (they are listed above):
$ make package

# or to install all
$ make all

# uninstall
$ make clean

# The standard installation directory is /home/${USER}
# The case below is to install at /home/user
$ USER=user make all

# or to install at /root
$ DIR=/root make all

```


