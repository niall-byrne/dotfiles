# Initiaze Environment
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=ExGxdxdhBxdxDxHBagacac
export LSCOLORSOLD=ExFxBxDxCxegedabagacad
export GREP_COLOR='0;31;40'

# Source ~/.bashrc
[[ -s ~/.bashrc ]] && source ~/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
