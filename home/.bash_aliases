# Locations
alias _="cd ~"
alias _workspace="cd ~/workspace"
alias _projects="cd ~/Projects"
alias _Projects="cd ~/Projects"
alias _homeshick="cd ~/.homesick/repos"

# Finder
alias f.show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias f.hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Python
alias p.mkvenv="python3.6 -m venv venv"
alias p.serve="python -m SimpleHTTPServer"
alias p.activate=". venv/bin/activate"
alias p.uuid="python -c 'import uuid; print(uuid.uuid4())'"

# Linux
alias l.largest="du -a . | sort -n -r | head -n 5"
alias l.listen="netstat -aLn"

# Editing
alias v.alias="vi ~/.bash_aliases"
alias v.path="vi ~/.bash_path"
alias v.rc="vi ~/.bashrc"
alias v.profile="vi ~/.bash_profile"

# Grep
alias cgrep="grep --color=always"

# Column Manipulation Shortcuts
for i in {1..10}; do alias "a$i"="awk '{ print $`echo ${i}` }'"; done
for i in {1..10}; do alias "c$i"="cut -d, -f`echo ${i}`"; done

# Normal Colors
Black='\033[30m'        # Black
Red='\033[31m'          # Red
Green='\033[32m'        # Green
Yellow='\033[33m'       # Yellow
Blue='\033[34m'         # Blue
Purple='\033[35m'       # Purple
Cyan='\033[36m'         # Cyan
White='\033[37m'        # White

# Bold
BBlack='\033[30m'       # Black
BRed='\033[31m'         # Red
BGreen='\033[32m'       # Green
BYellow='\033[33m'      # Yellow
BBlue='\033[34m'        # Blue
BPurple='\033[35m'      # Purple
BCyan='\033[36m'        # Cyan
BWhite='\033[37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

NC="\033[0m"               # Color Reset


# Functions
function ii()   # Get current host related info.
{

    source ${HOME}/bin/localAddress.sh
    UPTIME=$(uptime)

    echo -e "${BRed}Hostname:$NC" && hostname
    echo -e "${BRed}Kernel:$NC" && uname -a
    echo -e "${BRed}Users logged on:$NC " && who | awk '{ print $1 }' | sort --unique
    echo -e "${BRed}Current date :$NC " && date
    echo -e "${BRed}Uptime :$NC " && trim ${UPTIME} && echo
    echo -e "${BRed}Diskspace :$NC " && df -h | grep disk
    echo -e "${BRed}Local IP Address :$NC" && echo "${PRIVATE_IP}"
    echo -e "${BRed}Public IP Address :$NC" && echo "$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/"//g')"
    echo -e "${BRed}Network connections :$NC "
    echo -e "Established Connections:  $(netstat -np tcp | grep -v unix | grep ESTABLISHED | wc -l)"
    echo -e "Listeners for Connectons: $(netstat -anp tcp  | grep -v unix | grep LISTEN | wc -l)"
    echo
}


function trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
    echo -n "$var"
}

# Docker Shortcuts

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

function d.stop() {
	containers="$(docker ps -q)"
	[[ -z ${containers} ]] && echo "No containers to stop." && return 1
        docker stop ${containers}	
}
