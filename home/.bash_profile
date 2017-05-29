# ----------------------------------------------------------------
# Bash Profile - Launched During Login (or new Shell on OSX)
# ----------------------------------------------------------------

# Detect Platform on Login
PLATFORM=$(uname -s):$(uname -m)

# Setup Git
git config --global core.excludesfile ~/.gitignore_global


# Ensure .bash_env is sourced on every login
[[ -f ~/.bash_env ]] && source ~/.bash_env

# Ensure .bashrc is sourced on every login
[[ -s ~/.bashrc ]] && source ~/.bashrc
