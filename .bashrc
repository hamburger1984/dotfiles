# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -lah'
alias cm='cmake ..; make -j -l 1.5'
alias km='cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..; make -j -l 1.5'
alias qm='qmake ; make -j -l 1.5'
alias pull='git pull --rebase origin master'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export HISTCONTROL=erasedups
export HISTSIZE=5000

PS1="\[\e[0m\][\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\]-\t-\j] [\[\w\]]\$ "

#test -s ~/.alias && . ~/.alias || true
export PATH=/usr/lib64/ccache:$PATH
