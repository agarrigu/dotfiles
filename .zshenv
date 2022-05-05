# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private cargo bin if it exists
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# set PATH so it includes user's private cabal bin if it exists
if [ -d "$HOME/.cabal/bin" ] ; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

# set PATH so it includes user's nvim installation in mac, if it exists
if [ -d "$HOME/nvim-osx64/bin" ] ; then
    PATH="$HOME/nvim-osx64/bin:$PATH"
fi

# set PATH so it includes user's homebrew bin in osX if it exists
if [ -d "$HOME/homebrew/bin" ] ; then
    PATH="$HOME/homebrew/bin:$PATH"
fi

# set JAVA_HOME and add java bin to path if it exists
#export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
# if [ -d "$JAVA_HOME" ] ; then
#     PATH="$JAVA_HOME/bin:$PATH"
# fi

# set jdtls enviroment variables
#export JDTLS_HOME="$HOME/.local/share/nvim/lsp_servers/jdtls"
#export WORKSPACE="$HOME/workspace"
export NVM_DIR="$HOME/.nvm"
. "$HOME/.cargo/env"
