#------------------------------------------////
# Create by @rizsyad
# thanks for: 
# https://github.com/pikpikcu/dotfile
# https://github.com/panophan/bashrc-cool
# https://medium.com/@tzhenghao/a-guide-to-building-a-great-bashrc-23c52e466b1c
# https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c
# https://myopsblog.wordpress.com/2016/06/13/cheatsheet-bashrc/
#------------------------------------------////

#------------------------------------------////
# Colors:
#------------------------------------------////

# Colours have names too. Stolen from Arch wiki

txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

#------------------------------------------////
# export:
#------------------------------------------////

# Obviously.
export EDITOR=/usr/bin/vim

# COLOURS! YAAAY!
export TERM=xterm-256color

# Personal binaries
export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH

export GOPATH=~

#------------------------------------------////
# alias:
#------------------------------------------////

alias whatismyip='whatsmyip'
alias ping='ping -c 6'
alias fastping='ping -c 100 -s.2' # Do not wait interval 1 second, go fast
alias rm='rm -rf'
alias cp='cp -i'
alias mv='mv -i'
alias ns='netstat -alnp --protocol=inet'
alias h='history'
alias n='nano'
alias v='vim'
alias cls='clear'
alias c='clear'
alias cs='clear;ls'

# with sudo
alias s='sudo'
alias sn='sudo nano'
alias sv='sudo vim'
alias smv='sudo mv -i'
alias srm='sudo rm -rf'
alias scp='sudo cp -i'

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#with grep
alias hg='history | grep '
alias f="find . | grep " # Search files in the current folder

# some more ls aliases
alias ll='ls -lh'
alias la='ls -lha'
alias l='ls -CF'
alias lls='ls -l -h -g -F --color=auto'
alias lsam='ls -am'               # List files horizontally
alias lr='ls -lR'                 # recursive
alias lsx='ls -ax'                # sort right to left rather then in columns
alias lss='ls -shAxSr'            # sort by size
alias lt='ls -lAtrh'              # sort by date and human readable
alias lm='ls -al | more'          # pipe through 'more'

#cd features
alias home='cd ~'
alias des='cd ~/Desktop/'
alias dow='cd ~/Downloads/'
alias doc='cd ~/Documents/'
alias mus='cd ~/Music/'
alias pict='cd ~/Pictures/'
alias vid='cd ~/Videos/'

#Git make easier to use
alias g='git'
alias gs='git status'
alias gcom='git commit -m'
alias gclo='git clone'
alias gl='git log'
alias ga='git add -u'
alias gall='git add .'
#alias sth='git stash'

# chmod and permissions commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

alias update='sudo apt-get update && sudo apt-get upgrade'
alias q='exit'
alias shutdown='shutdown -h now'

#------------------------------------------////
# Original .bashrc:
#------------------------------------------////

# append to the history file, don't overwrite it
shopt -s histappend

# History control
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=100000
HISTFILESIZE=2000000

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Local settings go last
if [ -f ~/.localrc ]; then 
  source ~/.localrc
fi

#------------------------------------------////
# Custome .bashsrc:
# add feature
#------------------------------------------////

# Change up a variable number of directories
# E.g:
#   up   -> cd ../
#   up 2 -> cd ../../
#   up 3 -> cd ../../../
function up {
    local count=$1
    if [ -z "${count}" ]; then
        count=1
    fi
    local path=""
    for i in $(seq 1 ${count}); do
        path="${path}../"
    done
    cd $path
}

function upinfo {
    echo -ne "${green}$HOSTNAME ${red}uptime is ${green} \t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}

function extract {
    if [ -f $1 ] ; then
        case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

function subdo {
    if [ -z $1 ]; then
      echo "Error Command, ex: subdo example.com"
    else
      curl -s "https://api.hackertarget.com/hostsearch/?q=${1}" | sed "s/https:\/\///g" | sed "s/http:\/\///g" | sed "s/\///g"
      echo ""
    fi
}

function whatsmyip {
  echo -n "Internal IP: " ; ifconfig eth0 | awk '$1 == "inet" {print $2}'
  echo -n "External IP: " ; curl -s http://ipecho.net/plain; echo
}

function rot13 {
  if [ $# -eq 0 ]; then
		tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	else
		echo $* | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	fi
}

#Allows to change directory right after its creation
function mcd { mkdir -p "$1" && cd "$1";}


#------------------------------------------////
# Main Home:
#------------------------------------------////


# Red name for root
if [[ $(id -u) -eq "0" ]]; then
  user="${bldred}\u"
else
  user="${bldgrn}\u"
fi


# Patent Pending Prompt
export PS1="[${bldpur}\t${txtrst}]-${user}${txtwht}@${bldcyn}\h${txtrst}:${txtylw}\w${txtwht}\$${txtrst} "
