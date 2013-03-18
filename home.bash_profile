# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export HISTCONTROL=erasedups
export HISTSIZE=50000
export GRAILS_HOME="$HOME/Silpion/grails/grails";
export PATH=$PATH:$HOME/.local/bin:$HOME/bin:$GRAILS_HOME/bin
