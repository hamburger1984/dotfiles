# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
if [ -d $HOME/.bin ]; then
    PATH=$HOME/.bin:$PATH
fi

if [ -d $HOME/.local/bin ]; then
    PATH=$HOME/.opt/bin:$PATH
fi

if [ -d $HOME/.local/bin ]; then
    PATH=$HOME/.local/bin:$PATH
fi

if [ -d $HOME/Android/Sdk/ndk-bundle ]; then
    PATH=$HOME/Android/Sdk/ndk-bundle:$PATH
fi

if [ -d $HOME/Projects/nim/bin/ ]; then
    PATH=$HOME/Projects/nim/bin:$PATH
fi

if [ -d $HOME/.nimble/bin/ ]; then
    PATH=$HOME/.nimble/bin:$PATH
fi

if [ -d $HOME/.local/node_modules_global/bin/ ]; then
    PATH=$HOME/.local/node_modules_global/bin:$PATH
fi

if [ -d $HOME/.dotnet/ ]; then
    PATH=$HOME/.dotnet:$PATH
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
fi

if [ -n "$VIRTUAL_ENV" ]; then
    PATH="$VIRTUAL_ENV:$PATH"
fi

export PATH

export ANDROID_HOME=~/Android/Sdk
