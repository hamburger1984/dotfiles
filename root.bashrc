# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias reinstall='make uninstall; make -j -l 2.0 install'
alias l='ls -lah'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
