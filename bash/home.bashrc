# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias less='less --RAW-CONTROL-CHARS'
export LS_OPTS='--color=auto'
alias ls='ls ${LS_OPTS}'
alias l='ls -loah'
alias lt='ls -loaht'
alias lss='ls -loahS'

# cmake & make
alias cm='cmake ..; make -j -l 6'
# cmake (for kde) & make
alias km='cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..; make -j -l 6'
# qmake & make
alias qm='qmake ..; make -j -l 6'
# pip
alias pipup3.5='pip3.5 freeze --local | grep -v "^\-e" | cut -d= -f1 | xargs pip3.5 install -U'
# git
alias rpull='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && echo -n \"----- \" && echo \"{}\" | rev | cut -d\"/\" -f2 | rev && git pull" \;'
alias rfetch='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && echo -n \"----- \" && echo \"{}\" | rev | cut -d\"/\" -f2 | rev && git fetch --prune" \;'
alias rst='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && echo -n \"----- \" && echo \"{}\" | rev | cut -d\"/\" -f2 | rev && git status" \;'

## use with youtube-dl, grab a few (mrsuicidesheep?) tracks, cd to folder, win!
alias playFolder='find . -type f \( -iname "*.aiff" -o -iname "*.m4a" -o -iname "*.mp3" -o -iname "*.ogg" -o -iname "*.opus" -o -iname "*.webm" \) -printf "%Ts\t%p\n" | sort -nr | cut -f2 | sed "s/^\.\/\(.*\)/\1/" > .play.vlc && cvlc -I ncurses .play.vlc; rm -f .play.vlc'

alias flowll='ssh 212.45.111.154'
alias flowb='ssh 212.45.111.157'
alias berry='ssh root@192.168.1.71'

# other..
alias histstat="history | awk '{a[\$2]++ } END{for(i in a){print a[i] \" \" i}}'|sort -rn|head -n 25"

alias simplehttp='python -m SimpleHTTPServer'

alias svndiffview='svn diff --git > .temp.patch; vim .temp.patch; rm -f .temp.patch'

function spindown(){
    if test "$#" -ne 1; then
        echo "Usage: spindown drivename"
        return 0
    fi
    if mount | grep -q $1; then
        echo "$1 is mounted.. cannot spin down"
    else
        echo "spinning down $1"
        sudo hdparm -y $1
    fi
}

function adjustExif(){
while IFS= read -d $'\0' -r PIC; do
#DATE=$(exiftool -p '$DateTimeOriginal' "$PIC" | sed 's/[: ]//g')
DATE=$(exiftool -p '$CreateDate' "$PIC" | sed 's/[: ]//g')
touch -t $(echo $DATE | sed 's/\(..$\)/\.\1/') "$PIC"
done < <(find . -iname '*.jpg' -print0)
}

function nodemcu_prepare(){
export PATH=/home/andreas/Projects/nodemcu/esp-open-sdk/xtensa-lx106-elf/bin:$PATH
}

# history..
export HISTCONTROL=ignoredups
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash4_history
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

# tty font
if [ $TERM = linux ]; then
    setfont /lib/kbd/consolefonts/Lat2-Terminus16.psfu.gz
fi

# prompt
export PS1='\e[0m\t \e[0;33m\u\e[0m@\e[0;33m\h\e[0m \[\w\] \e[0;34m$(git branch 2>/dev/null|cut -f2 -d\* -s| xargs echo)\e[0m\$ '

if [ -n "$VIRTUAL_ENV" ]; then
    export PS1="$PS1\[\033[0;34m\](${VIRTUAL_ENV##*/})\[\e[0m\] "
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export EDITOR="vim"
