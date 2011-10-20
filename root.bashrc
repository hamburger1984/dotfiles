# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias reinstall='make uninstall; make -j -l 2.0 install'
alias l='ls -lah'
alias rpmsizes='rpm -qa --qf "%12{SIZE} %-20{NAME} %-10{VERSION}\n" | sort -nr | less'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
