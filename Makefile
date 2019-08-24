USER := ${USER}
DIR ?= /home/${USER}
TERMITE_THEME ?= solarized-light

packages = nvim polybar i3 termite rofi zsh scripts

.PHONY: $(packages)

all: $(packages)

$(packages): 
	stow -S -v -t ${DIR} $@ 

.PHONY: termite-theme
termite-theme:
	cp base16-termite/themes/base16-${TERMITE_THEME}.config termite/.config/termite/theme
	cat termite/.config/termite/options termite/.config/termite/theme > termite/.config/termite/config


.PHONY: clean
clean:
	stow -D -v -t ${DIR} $(packages) 
