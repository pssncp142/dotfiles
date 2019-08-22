
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

source <(antibody init)
antibody bundle < $ZDOTDIR/.zsh_plugins.txt

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
EDITOR=/usr/bin/nvim
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ydallilar/.config/zsh.zshrc'

autoload -Uz compinit # promptinit
compinit
# promptinit
# End of lines added by compinstall


function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}


# added by Miniconda2 4.3.11 installer
#export PATH="/home/ydallilar/software/miniconda2/bin:$PATH"
alias anaconda='export PATH="/home/ydallilar/software/miniconda2/bin:$PATH"'

#ds9 xpa_method=local
#alias ds9='ds9 -xpa local'

source /etc/profile.d/vte.sh

export Dropbox="/data/Dropbox/Dropbox (UFL)"

#echo " "
#neofetch
alias unlock='sudo rm /var/lib/pacman/db.lck'

export GITHUB_TOKEN=2b45d23d9710a2e6337ad31f18640e10e258b136

export HEADAS=/opt/heasoft/x86_64-pc-linux-gnu-libc2.28
alias heainit='source $HEADAS/headas-init.sh'

export PATH=$PATH:/opt/isis/isis/1.6.2/bin/
export ISIS_SRCDIR=/opt/isis/isis/1.6.2

export SPOTIPY_CLIENT_ID='2a3963556abe48c7926eb65e99a62d44'
export SPOTIPY_CLIENT_SECRET='cbea4b8398b44493a9ccc137e051acaf'
export SPOTIPY_REDIRECT_URI='http://localhost/'

export OSCDIR=/data/software/osc

alias sllinux='VBoxHeadless -s SL-Linux'

rgbtocmyk () { gs -dSAFER -dBATCH -dNOPAUSE -dNOCACHE -sDEVICE=pdfwrite -sColorConversionStrategy=CMYK -dProcessColorModel=/DeviceCMYK -sOutputFile="$2" "$1"; }

rgbtocmyk2 () { gs -dSAFER -dBATCH -dNOPAUSE -dNOCACHE -sDEVICE=eps2write -sColorConversionStrategy=CMYK -dProcessColorModel=/DeviceCMYK -sOutputFile="$2" "$1"; }

alias aa="source /opt/anaconda2/bin/activate"
alias ad="conda deactivate"

export PATH="$PATH:/opt/cuda/bin"

#some python stuff

#export SPOTIPY_CLIENT_ID='dd2c97e35e7a48fe9ffbbf4d0d736819'
#export SPOTIPY_CLIENT_SECRET='a4009784b9ce42db8e3f2fac89178c58'

export THESIS="/data/Dropbox/Dropbox (UFL)/Phd_Thesis/SFLatex_2018/"

export RGDRIVE="/data/Rclone/Gdrive"
export RSABANCI="/data/Rclone/Sabanci"
export RUFONE="/data/Rclone/UFonedrive"

prime () { __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia "$@" }

