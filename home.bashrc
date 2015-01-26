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
alias l='ls -lah'
alias lt='ls -laht'

alias resetcolors='konsoleprofile colors=DarkPastels'
alias su='konsoleprofile colors=DarkPastelsSU; /usr/bin/su; resetcolors'

# cmake & make
alias cm='cmake ..; make -j -l 4'
# cmake (for kde) & make
alias km='cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..; make -j -l 4'
# qmake & make
alias qm='qmake ; make -j -l 4'

alias rpull='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && echo -n \"----- \" && echo \"{}\" | rev | cut -d\"/\" -f2 | rev && git pull" \;'
alias rfetch='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && echo -n \"----- \" && echo \"{}\" | rev | cut -d\"/\" -f2 | rev && git fetch --prune" \;'
alias rst='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && echo -n \"----- \" && echo \"{}\" | rev | cut -d\"/\" -f2 | rev && git status" \;'

## use with youtube-dl, grab a few (mrsuicidesheep?) tracks, cd to folder, win!
alias playFolder='find . -type f \( -iname "*.aiff" -o -iname "*.m4a" -o -iname "*.mp3" -o -iname "*.ogg" -o -iname "*.webm" \) | sed "s/^\.\/\(.*\)/\1/" | sort > .play.vlc && cvlc -I ncurses .play.vlc; rm -f .play.vlc'

alias htpc='ssh root@192.168.1.71'
alias mobi1='ssh krohn@mobi1.cpt.haw-hamburg.de'
#alias mobi5='konsoleprofile colors=Solarized; ssh krohn@141.22.213.44; resetcolors'
#alias mobi5='ssh krohn@mobi5.cpt.haw-hamburg.de'
alias linklab='ssh krohn@212.45.111.154'

# other..
alias histstat="history | awk '{a[\$2]++ } END{for(i in a){print a[i] \" \" i}}'|sort -rn|head -n 12"

alias simplehttp='python -m SimpleHTTPServer'

function adjustExif(){
while IFS= read -d $'\0' -r PIC; do
#DATE=$(exiftool -p '$DateTimeOriginal' "$PIC" | sed 's/[: ]//g')
DATE=$(exiftool -p '$CreateDate' "$PIC" | sed 's/[: ]//g')
touch -t $(echo $DATE | sed 's/\(..$\)/\.\1/') "$PIC"
done < <(find . -iname '*.jpg' -print0)
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

# Colour in man pages
# ============================================================
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# prompt
export PS1='\[\e[0m\]\t \[\e[0;33m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\] \[\w\] \[\e[0;34m\]$(git branch 2>/dev/null|cut -f2 -d\* -s| xargs echo)\[\e[0m\]\$ '

