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
PATH="$HOME/nvim-osx64/bin:$PATH"
PATH="$HOME/homebrew/bin:$PATH"

# set JAVA_HOME and add java bin to path if it exists
#export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
# if [ -d "$JAVA_HOME" ] ; then
#     PATH="$JAVA_HOME/bin:$PATH"
# fi

# set jdtls enviroment variables
#export JDTLS_HOME="$HOME/.local/share/nvim/lsp_servers/jdtls"
#export WORKSPACE="$HOME/workspace"

# # Wait a second, does this work without this? Except for sumneko_lua?
# # set PATH so it includes LSP servers for nvim if they exist
# # to set Path introduce path to bin directory
#    lua_lspr="$HOME/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin"
# python_lspr="$HOME/.local/share/nvim/lsp_servers/python/node_modules/.bin"
#   bash_lspr="$HOME/.local/share/nvim/lsp_servers/bash/node_modules/.bin"
#   rust_lspr="$HOME/.local/share/nvim/lsp_servers/rust"
#   rome_lspr="$HOME/.local/share/nvim/lsp_servers/rome/node_modules/.bin"
#    vim_lspr="$HOME/.local/share/nvim/lsp_servers/vim/node_modules/.bin"
# # Until rome  gets better
# html_lspr="$HOME/.local/share/nvim/lsp_servers/html/node_modules/.bin"
# cssls_lspr="$HOME/.local/share/nvim/lsp_servers/cssls/node_modules/.bin"
 
# lsp_server_routes=($lua_lspr $python_lspr $bash_lspr $rust_lspr $rome_lspr $vim_lspr  $html_lspr  $cssls_lspr)

# for lsp_server_route in "${lsp_server_routes[@]}"; do
#     if [ -d $lsp_server_route ] ; then
#         PATH="$PATH:$lsp_server_route"
#     fi
# done
