# ----------------------------------------------------------------
# Bash Aliases - Cross Platform Aliases and Source Logic
# ----------------------------------------------------------------

# Networking
alias n.online="ping -c 3 8.8.8.8"

# Editing
alias v.alias="vi ~/.bash_aliases"
alias v.alias_osx="vi ~/.bash_aliases.osx"
alias v.env="vi ~/.bash_env"
alias v.path="vi ~/.bash_path"
alias v.profile="vi ~/.bash_profile"
alias v.rc="vi ~/.bashrc"

# Work
alias l.vault=". ~/workspace/windscribe/devops-provisioning/docker/credentials"

# File Utils
alias f.clean="find . -name ".DS_Store"  -exec rm {} \;"

# Column Manipulation Shortcuts
for i in {1..10}; do alias "a$i"="awk '{ print $`echo ${i}` }'"; done
for i in {1..10}; do alias "c$i"="cut -d, -f`echo ${i}`"; done

# White Space Remover
function trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
    echo -n "$var"
}

# Docker Shortcuts

function d.quickey() {
	docker run -it --name quickey $1 sh
}

function d.rm() {
	containers="$(docker ps -qa)"
	[[ -z ${containers} ]] && echo "No containers to remove." && return 1
	docker rm ${containers}
}

function d.rmi() {
	images="$(docker images -q)"
	[[ -z ${images} ]] && echo "No images to remove." && return 1
	docker rmi ${images}
}

function d.empty() {
	images="$(docker images | grep none | awk '{print $3}')"
	[[ -z ${images} ]] && echo "No images to remove." && return 1
	docker rmi ${images}
}

function d.stop() {
	containers="$(docker ps -q)"
	[[ -z ${containers} ]] && echo "No containers to stop." && return 1
        docker stop ${containers}
}

# Load Platform Specific Alias Files
case ${PLATFORM} in
*Darwin*)
    [[ -f ~/.bash_aliases.osx ]] && source ~/.bash_aliases.osx
    ;;
*Linux*)
    [[ -f ~/.bash_aliases.linux ]] && source ~/.bash_aliases.linux
    ;;
*)
    echo "WARNING: Cannot set environment for this unknown platform."
    ;;
esac
