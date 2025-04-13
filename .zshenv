paths=(
"$HOME/bin"
"$HOME/.local/bin"
"$HOME/.cargo/bin"
"$HOME/.cargo/env"
)

for p in "${paths[@]}"; do
	[[ -d $p ]] && export PATH="$p:$PATH"
done

export EDITOR="vi"
export VISUAL="vi"
