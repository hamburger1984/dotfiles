# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
export PATH=$HOME/.bin:$HOME/.opt/bin:$HOME/.local/bin:$HOME/Android/Sdk/ndk-bundle:$PATH

if [ -n "$VIRTUAL_ENV" ]; then
    export PATH="$VIRTUAL_ENV:$PATH"
fi
export ANDROID_HOME=~/Android/Sdk
