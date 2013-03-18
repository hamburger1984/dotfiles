# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias backup2usb='cd ~; obnam backup /home/andreas/.ssh/ /home/andreas/haw/ /home/andreas/Pictures/ /home/andreas/Silpion/ /etc/yum.repos.d/'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -lah'

alias resetcolors='konsoleprofile colors=Solarized'
alias su='konsoleprofile colors=WhiteOnBlack; /usr/bin/su; resetcolors'

# cmake & make
alias cm='cmake ..; make -j -l 1.75'
alias cm64='cmake -DLIB_SUFFIX=64 ..; make -j -l 1.75'
# cmake (for kde) & make
alias km='cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..; make -j -l 1.75'
# qmake & make
alias qm='qmake ; make -j -l 1.75'
# autogen -> 64bit & prefix
alias autogen64='./autogen.sh --prefix=/usr --libdir=/usr/lib64'

alias pull='git pull --rebase origin master'
alias rpull='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git fetch && git pull origin master" \;'
alias rlast='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git log -1 --pretty=format:\"%ad %h %an\"" \;'

alias htpc='ssh root@192.168.1.71'

alias mobi1='ssh krohn@mobi1.cpt.haw-hamburg.de'

# other..
alias histstat="history | awk '{a[\$2]++ } END{for(i in a){print a[i] \" \" i}}'|sort -rn|head -n 12"
alias simplehttp='python -mSimpleHTTPServer'

function remindme(){
# remind me, its important!
# adapted from: http://usalug.org/phpBB2/viewtopic.php?t=13209&sid=a641eb81eff1925e714a2fc6576e8a13
# further adapted from: http://linux4all.dreamwidth.org/14455.html
if [[ $# -lt 2 ]]
then
echo "usage: 
	remindme 10m [title] message
	remindme @7:00 [title] message"
return
elif [[ $# -eq 2 ]]
then
title="Remind Me:"
message="${@:2}"
elif [[ $# -gt 2 ]]
then
title="$2"
message="${@:3}"
fi
if [[ "${1:0:1}" == "@" ]]
then
#at ${1:1} << EOF
#notify-send --icon=dialog-information "$title" "$message"
#EOF
echo "notify-send --icon=dialog-information \"$title\" \"$message\"" | at ${1:1}
else
sleep $1 && notify-send --icon=dialog-information "$title" "$message" &
fi
}

function adjustExif(){
while IFS= read -d $'\0' -r PIC; do
#DATE=$(exiftool -p '$DateTimeOriginal' "$PIC" | sed 's/[: ]//g')
DATE=$(exiftool -p '$CreateDate' "$PIC" | sed 's/[: ]//g')
touch -t $(echo $DATE | sed 's/\(..$\)/\.\1/') "$PIC"
done < <(find . -iname '*.jpg' -print0)
}

export PS1='\[\e[0m\][\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\]-\t-\j] [\[\w\]]\$ '