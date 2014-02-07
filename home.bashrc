# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#alias backup2usb='cd ~; obnam backup /home/andreas/.ssh/ /home/andreas/haw/ /home/andreas/Pictures/ /home/andreas/Silpion/ /etc/yum.repos.d/'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -lah'

alias resetcolors='konsoleprofile colors=DarkPastels'
alias su='konsoleprofile colors=WhiteOnBlack; /usr/bin/su; resetcolors'

# cmake & make
alias cm='cmake ..; make -j -l 4'
# cmake (for kde) & make
alias km='cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..; make -j -l 4'
# qmake & make
alias qm='qmake ; make -j -l 4'

alias rpull='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;'
alias rfetch='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git fetch" \;'
alias rlast='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git log -1 --pretty=format:\"%ad %h %an\"" \;'

function playFolder(){
## use with youtube-dl, grab a few (mrsuicidesheep?) tracks, cd to folder, win!
    while true
    do
        FILE=`find . -type f -iname "*.mp3" -o -iname "*.ogg" -o -iname "*.m4a" | sort -R | head -n 1`
        echo " ▸ $FILE"
        cvlc --play-and-exit "$FILE" &> /dev/null
        sleep 0.5s
    done
}

alias htpc='ssh root@192.168.1.71'

alias mobi1='ssh krohn@mobi1.cpt.haw-hamburg.de'
alias linklab='ssh krohn@212.45.111.154'
alias centos='ssh andreas@192.168.122.60'
alias centos_root='ssh root@192.168.122.60'

## Python stuff
alias pip-up='pip-python3 freeze | cut -d = -f 1 | xargs -n 1 pip-python3 search | grep -B2 "LATEST:"'

# other..
alias histstat="history | awk '{a[\$2]++ } END{for(i in a){print a[i] \" \" i}}'|sort -rn|head -n 12"
alias simplehttp='python -mSimpleHTTPServer'

alias clementine-check="pushd ~/.config/Clementine/ > /dev/null; sqlite3 clementine.db 'select count(*) from songs where unavailable=1;'; popd > /dev/null"
alias clementine-fix="killall clementine; pushd ~/.config/Clementine/ > /dev/null; sqlite3 clementine.db 'update songs set unavailable=0;'; popd > /dev/null; clementine&"

function adjustExif(){
while IFS= read -d $'\0' -r PIC; do
#DATE=$(exiftool -p '$DateTimeOriginal' "$PIC" | sed 's/[: ]//g')
DATE=$(exiftool -p '$CreateDate' "$PIC" | sed 's/[: ]//g')
touch -t $(echo $DATE | sed 's/\(..$\)/\.\1/') "$PIC"
done < <(find . -iname '*.jpg' -print0)
}

export PS1='\[\e[0m\][\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\]-\t-\j] [\[\w\]]\[\e[0;34m\]$(git branch 2>/dev/null|cut -f2 -d\* -s| xargs echo)\[\e[0m\]\$ '

