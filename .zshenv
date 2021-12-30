# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$HOME/.local/bin"
fi

# set PATH so it includes user's private cargo bin if it exists
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$PATH:$HOME/.cargo/bin"
fi

# set PATH so it includes snap if it exists
if [ -d "/snap/bin" ] ; then
    PATH="$PATH:/snap/bin"
fi

# set JAVA_HOME and add java bin to path if it exists
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
if [ -d "$JAVA_HOME" ] ; then
    PATH="$PATH:$JAVA_HOME/bin"
fi

# set jdtls enviroment variables
#export JDTLS_HOME="$HOME/.local/share/nvim/lsp_servers/jdtls"
#export WORKSPACE="$HOME/workspace"

# Wait a second, does this work without this? Except for sumneko_lua?
# set PATH so it includes LSP servers for nvim if they exits
lua_lspr="$HOME/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin"
python_lspr="$HOME/.local/share/nvim/lsp_servers/python/node_modules/.bin"
bash_lspr="$HOME/.local/share/nvim/lsp_servers/bash/node_modules/.bin"
rust_lspr="$HOME/.local/share/nvim/lsp_servers/python/node_modules/.bin"
vim_lspr="$HOME/.local/share/nvim/lsp_servers/vim/node_modules/.bin"

lsp_server_routes=($lua_lspr $python_lspr $bash_lspr $rust_lspr $vim_lspr)

for lsp_server_route in "${lsp_server_routes[@]}"; do
    if [ -d $lsp_server_route ] ; then
        PATH="$PATH:$lsp_server_route"
    fi
done
