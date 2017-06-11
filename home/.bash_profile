# ----------------------------------------------------------------
# Bash Profile - Launched During Login (or new Shell on OSX)
# ----------------------------------------------------------------

# Ensure .bashrc is sourced on every login
[[ -s ~/.bashrc ]] && source ~/.bashrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/niall/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/niall/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/niall/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/niall/Downloads/google-cloud-sdk/completion.bash.inc'; fi
