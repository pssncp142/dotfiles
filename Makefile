USER := ${USER}
DIR ?= /home/${USER}

packages = nvim polybar i3 termite rofi zsh

.PHONY: $(packages)

all: $(packages)

$(packages): 
	stow -S -v -t ${DIR} $@ 

.PHONY: clean
clean:
	stow -D -v -t ${DIR} $(packages) 
