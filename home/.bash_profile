# Initiaze Environment
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=ExGxdxdhBxdxDxHBagacac
export LSCOLORSOLD=ExFxBxDxCxegedabagacad
export GREP_COLOR='0;31;40'
export PS1='\u@MACBOOK:\w$ '

# Configure GIT
export GIT_EXTERNAL_DIFF=$HOME/bin/tkdiff.sh
export GIT_EDITOR=/usr/local/bin/vim



# Source ~/.bashrc
[[ -s ~/.bashrc ]] && source ~/.bashrc
