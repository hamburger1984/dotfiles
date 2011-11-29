# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -lah'

# cmake & make
alias cm='cmake ..; make -j -l 1.5'
# cmake (for kde) & make
alias km='cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..; make -j -l 1.5'
# qmake & make
alias qm='qmake ; make -j -l 1.5'

alias pull='git pull --rebase origin master'

# other..
alias histstat="history | awk '{a[\$2]++ } END{for(i in a){print a[i] \" \" i}}'|sort -rn|head -n 12"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export HISTCONTROL=erasedups
export HISTSIZE=5000

PS1="\[\e[0m\][\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\]-\t-\j] [\[\w\]]\$ "

#test -s ~/.alias && . ~/.alias || true

# add ccache -> faster [re]builds
export PATH=/usr/lib64/ccache:$PATH
