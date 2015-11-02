# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
export PATH=$HOME/bin:$HOME/opt/bin:$PATH

if [ -n "$VIRTUAL_ENV" ]; then
    export PATH="$VIRTUAL_ENV:$PATH"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/.profile ]; then
    . ~/.profile
fi

