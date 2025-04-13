# paths=(
#     "$HOME/bin"
#     "$HOME/.local/bin"
#     "$HOME/.cargo/bin"
# )

# # for path in ${paths[@]} ; do
#     # [ "${PATH#*:$path}" == $PATH ] && export PATH="$path:$PATH"
# # done

# [ "${PATH#*$HOME/bin:}" == $PATH ] && export PATH="$HOME/bin:$PATH"
# [ "${PATH#*:$HOME/.cargo/bin}" == $PATH ] && export PATH="$HOME/.cargo/bin:$PATH"
# [ "${PATH#*:$HOME/.local/bin}" == $PATH ] && export PATH="$HOME/.local/bin:$PATH"

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.cargo/env" ] ; then
    PATH="$HOME/.cargo/env:$PATH"
fi
