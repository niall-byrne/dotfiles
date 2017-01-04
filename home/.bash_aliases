# Locations
alias _home="cd ~"
alias _downloads="cd ~/Downloads"
alias _projects="cd ~/Projects"

# Grep
alias cgrep="grep --color=always"

# Update Config Repo
alias update_config="cd ~/.confighome && git stage . && git commit"

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
    echo -e "${BRed}Hostname:$NC" && hostname && uname -a
    echo -e "${BRed}Users logged on:$NC " && who | awk '{ print $1 }' | sort --unique
    echo -e "${BRed}Current date :$NC " && date
    echo -e "${BRed}Machine stats :$NC " && uptime
    echo -e "${BRed}Diskspace :$NC " && df -h | grep disk
    echo -e "${BRed}Local IP Address :$NC" && trim "`ifconfig | grep inet | grep netmask | grep broadcast`"
    echo -e "\n${BRed}Network connections :$NC "
    echo -e "Established Connections:  `netstat -p tcp | grep ESTABLISHED | wc -l`" 
    echo -e "Listeners for Connectons: `netstat -p tcp | grep LISTEN | wc -l`"
    echo
}

function trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
    echo -n "$var"
}


