# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.bin/sensible.bash ]; then
    source ~/.bin/sensible.bash
fi
# minor modification:
export HISTIGNORE="&:[ ]*:exit:ls:l:bg:fg:history:clear"


# User specific aliases and functions
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias less='less --RAW-CONTROL-CHARS'
if command -v "lsd" >/dev/null 2>&1; then
    # use lsd if available
    LS='lsd'
    alias ltr='ls --tree'
else
    export LS_OPTS='--color=auto'
    LS='ls ${LS_OPTS}'
fi
#alias ls='ls ${LS_OPTS}'
alias ls='${LS}'
alias l='ls -lah'
alias lt='ls -laht'
alias lss='ls -lahS'
alias vim='nvim'

# cmake & make
alias cm='cmake ..; make -j -l 6'
# cmake (for kde) & make
alias km='cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..; make -j -l 6'
# qmake & make
alias qm='qmake ..; make -j -l 6'
# pip
alias pipup3='pip3 freeze --user --local | grep -v "^\-e" | cut -d= -f1 | xargs pip3 install --user -U'

# git
alias rpull='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && echo -n \"----- \" && echo \"{}\" | rev | cut -d\"/\" -f2 | rev && git pull" \;'
alias rfetch='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && echo -n \"----- \" && echo \"{}\" | rev | cut -d\"/\" -f2 | rev && git fetch --all --prune" \;'
alias rlast='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && echo -n \"----- \" && echo \"{}\" | rev | cut -d\"/\" -f2 | rev && git log -3 --format=\"%Cblue%>(30)%ar %C(yellow)%h %Cgreen%aN%Creset %s\" --date=local" \;'
alias rst='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && echo -n \"----- \" && echo \"{}\" | rev | cut -d\"/\" -f2 | rev && git status" \;'

## use with youtube-dl, grab a few (mrsuicidesheep?) tracks, cd to folder, win!
alias playFolder='find . -type f \( -iname "*.aiff" -o -iname "*.m4a" -o -iname "*.mp3" -o -iname "*.ogg" -o -iname "*.opus" -o -iname "*.webm" \) -printf "%Ts\t%p\n" | sort -nr | cut -f2 | sed "s/^\.\/\(.*\)/\1/" > .play.vlc && cvlc -I ncurses -Z .play.vlc; rm -f .play.vlc'

alias flowll='ssh 212.45.111.154'
alias flowb='ssh 212.45.111.157'

# other..
alias histstat="history | awk '{a[\$2]++ } END{for(i in a){print a[i] \" \" i}}'|sort -rn|head -n 25"

#alias simplehttp='python -m SimpleHTTPServer'

# close once last tab is closed.
alias tterm='tabbed -p -1 -c -d xterm -into'
# keep at least one instance open ('-f' ~ fill with new xterm instance).
#alias term='tabbed -f -g 1140x880 -d xterm -into'

# spin down mechanical disks before unplugging (seldom needed these days)
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

if [ $TERM = linux ]; then
    # tty font
    if [ -f /lib/kbd/consolefonts/Lat2-Terminus16.psfu.gz ]; then
        setfont /lib/kbd/consolefonts/Lat2-Terminus16.psfu.gz
    elif [ -f /usr/share/consolefonts/Lat2-Terminus12x6.psf.gz ]; then
        setfont /usr/share/consolefonts/Lat2-Terminus12x6.psf.gz
    fi
elif [ $TERM = xterm ]; then
    # tell neovim about colors
    export TERM="xterm-256color"
elif [ $TERM = screen ]; then
    # tell neovim about colors
    export TERM="screen-256color"
fi

# prompt
# get current branch in git repo
function parse_git_branch() {
    BRANCH=`LANG="CC" git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "${BRANCH}${STAT} "
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`LANG="CC" git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

function print_tty {
    local value=$(tty)
    #tput cup $(tput lines) $(($(tput cols) - ${#value} - 2))
    tput cup 0 $(($(tput cols) - ${#value} - 2))
    printf ' %s ' $value
}

function check_venv {
    if [ -n "$VIRTUAL_ENV" ]; then
        echo "${VIRTUAL_ENV##*/} "
    fi
}

function hr {
  local start=$'\e(0' end=$'\e(B' line='qqqqqqqqqqqqqqqq'
  local cols=${COLUMNS:-$(tput cols)}
  while ((${#line} < cols)); do line+="$line"; done
  printf '%s%s%s\n' "$start" "${line:0:cols}" "$end"
}
callHr='\[$(tput setaf 240; hr; tput sgr0)\]'

prompt='\t \[\e[33m\]\h\[\e[39m\] \w '
callTTY='\[$(tput sc; print_tty; tput rc)\]'
addGIT='\[\e[34m\]$(parse_git_branch)\[\e[39m\]'
addVENV='\[\e[34m\]$(check_venv)\[\e[39m\]'
PROMPT_COMMAND=update_prompt
function update_prompt {
    PS1="${callHr}${callTTY}${prompt}${addGIT}${addVENV}\\$ "
}

export EDITOR="nvim"
