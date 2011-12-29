# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'
alias l='ls -lah'

alias reinstall='make uninstall; make -j -l 2.0 install'
alias rpmsizes='rpm -qa --qf "%12{SIZE} %-32{NAME} %-15{VERSION} %20{RELEASE}\n" | sort -nr | less'

alias bluetooth_off='echo "0" > /sys/devices/platform/thinkpad_acpi/bluetooth_enable'
alias bluetooth_on='echo "1" > /sys/devices/platform/thinkpad_acpi/bluetooth_enable'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export HISTCONTROL=erasedups
export HISTSIZE=5000

PS1='\[\e[0m\][\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;31m\]\h\[\e[0m\]-\t-\j] [\[\w\]]\$ '
